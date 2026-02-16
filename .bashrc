[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

## Prompt
PS1='\[\033[38;2;129;161;193m\]\u\[\033[0m\]@\[\033[38;2;136;192;208m\]\h\[\033[0m\]:\[\033[38;2;180;142;173m\]\w\[\033[0m\]\[\033[38;2;205;214;244m\]\$ \[\033[0m\]'

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
