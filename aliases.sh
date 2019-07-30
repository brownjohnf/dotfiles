alias ls='ls --color=auto'
alias la='ls -A'
alias dir='dir --color=auto'
alias diffd='diff -s -t -E --tabsize 2 --suppress-common-lines'
alias vdir='vdir --color=auto'
alias vi='vim'
alias gg='git lg'
alias gis='git status'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias c=clear
alias dc=docker-compose
alias cat=bat
alias cdd="cd ~/Downloads"
alias fprint="ssh-keygen -l -E md5 -f"
alias k="kubectl"
alias lla="ls -lah"
alias ll="ls -lFh"
alias ping="prettyping --nolegend"
alias tf="terraform"
alias tree="tree -I node_modules -I venv -I target"

alias emp-prod='EMPIRE_API_URL=https://empire.textio.tech emp'
alias emp-staging='EMPIRE_API_URL=https://empire-staging.textio.tech emp'
alias emp-data-staging='EMPIRE_API_URL=https://empire-data-staging.textio.tech emp'
alias emp-data-prod='EMPIRE_API_URL=https://empire-data-prod.textio.tech emp'
alias emp-predev='EMPIRE_API_URL=https://empire-predev.textio.tech emp'

# vi:syntax=sh
