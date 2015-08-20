# Created by newuser for 5.0.7

autoload -U compinit promptinit colors
compinit
promptinit
colors

# This will set the default prompt to the walters theme
prompt adam2

setopt HIST_IGNORE_DUPS
setopt interactivecomments
bindkey -e

HISTFILE=$HOME/.zsh_history
HISTSIZE=500000000
SAVEHIST=500000000

export PATH=$HOME/bin:$PATH

alias c=clear
alias ll="ls -lh"
alias lla="ls -lah"
alias ff=freight-forwarder
alias dc=docker-compose
alias dm=docker-machine
alias rc=rancher-compose

# Python nonsense
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

func dm-devbox ()
{
  export DOCKER_TLS_VERIFY=1;
  export DOCKER_CERT_PATH="/home/jackb/benjamin/.docker/certs/client/dev";
  export DOCKER_HOST="tcp://dp-jackb01-dev.sea1.office.priv:2376"
}

export EDITOR=vim

