[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

## Prompt
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'; }
BRANCH='\[\e[38;2;225;117;15m\]$(git_branch)\[\e[38;2;234;175;37m\]'
#WARN='\[\e[1;41;37m\]$(if [ $? -ne 0 ]; then echo "[!!!-$?]";fi)\[\e[0m\]'
DIR='\[\e[38;2;225;117;15m\]$(pwd | sed "s/\([^\/]\)[^\/]*\//\1\//g")\[\e[38;2;234;175;37m\]'
HOST='\[\e[38;2;234;175;37m\]\u@\h:\[\e[0m\]'

export PS1="$HOST$BRANCH$DIR$ "

fprint () {
    toilet $1 -f future.tlf --filter crop -w 90 | lolcat
}

export -f fprint

( uname --nodename --operating-system |sed "s/-MANJARO//" | toilet $1 -f pagga.tlf --filter crop -w 90 ; echo -n '') | lolcat -p 200 -S 7
( uname -r |sed "s/-MANJARO//" | toilet $1 -f pagga.tlf --filter crop -w 90 ; echo '--------------------------------------------------------------') | lolcat -p 200 -S 7
##

## Alias
alias ls="ls -a --color=auto"
alias clr="clear && source ~/.bashrc"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
#alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
#alias cleanup="yay -Scc --noconfirm; yay -Yc --noconfirm; sudo rm -r /var/cache/pacman/pkg/*"
# Switched to paru, needs changing
##
