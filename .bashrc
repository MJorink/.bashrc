[[ $- != *i* ]] && return

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'; }
BRANCH='\[\e[36m\]$(git_branch)\[\e[0m\]'
WARN='\[\e[1;41;37m\]$(if [ $? -ne 0 ]; then echo "[!!!-$?]";fi)\[\e[0m\]'
DIR='\[\e[35m\]$(pwd | sed "s/\([^\/]\)[^\/]*\//\1\//g")\[\e[0m\]'
HOST='\[\e[32m\]\u\[\e[0m\]\[\e[35m\]@\[\e[0m\]\[\e[33m\]\h\[\e[0m\]\[\e[31m\]:\[\e[0m\]'

export PS1="$WARN$HOST$BRANCH$DIR$ "

fprint () {
    toilet $1 -f future.tlf --filter crop -w 90 | lolcat
}

export -f fprint

( uname -sr |sed "s/-MANJARO//" | toilet $1 -f pagga.tlf --filter crop -w 90 ; echo -n ' ' ; date +%d-%m-%Y ; uptime ) | lolcat -p 9 -S 0


alias ls="ls -a --color=auto"
alias clr="clear && source ~/.bashrc"
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias cleanup='yay -Sc && yay -Scc && yay -Yc'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias mdwm="cd ~/dwm-jorink; sudo make clean install; cd -"
alias cdwm="micro ~/dwm-jorink/config.h"
alias mst="cd ~/dwm-st; sudo make clean install; cd -"
alias cst="micro ~/dwm-st/config.h"
