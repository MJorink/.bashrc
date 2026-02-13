[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

## Prompt
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'; }
BRANCH='\[\e[36m\]$(git_branch)\[\e[0m\]'

export PS1=$BRANCH"\[$(tput setaf 39)\]\u\[$(tput setaf 45)\]@\[$(tput setaf 51)\]\h \[$(tput setaf 195)\]\w \[$(tput sgr0)\]$ "

#uname --nodename --operating-system | figlet
#uname -r | figlet

fastfetch
##

## Alias
alias ls="ls -a --color=auto"
alias clr="clear && source ~/.bashrc"
alias cff="clear && fastfetch"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias cleanup="paru -c; paru -Scc --noconfirm; sudo rm -r /var/cache/pacman/pkg/*"
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
##
