#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source ~/.git-prompt.sh
source ~/.bash/run-time.sh

PS1='\n\[\e[38;5;208;1;2;3m\]#\# \[\e[11;38;5;104m\][#$((\#-1)) ${timer_show}s]\[\e[0m\]';
PS1="${PS1} \[\e[0m\][\[\e[92;1;3m\]\u\[\e[0;38;5;196m\]@\[\e[38;5;33;1;3m\]\h\[\e[0m\] \[\e[38;5;118;2m\]\w\[\e[0m\]]"
PS1="${PS1} \[\e[96;2m\][\D{%I:%M:%S %p}]"
PS1="${PS1} \[\e[38;5;51;1;3m\]$(__git_ps1 "  %s")"
PS1="${PS1} \n\[\e[0;1;5m\]>> \[\e[0m\]"

# ============== Alias =========== #
source ~/.bash/artisan.sh
source ~/.bash/git.sh
