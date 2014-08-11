[[ $- == *i* ]] || return
export TERM=xterm-color
#export COLORTERM=gnome-256
. ~/.bash_aliases
. ~/.bash_prompts

# ignore dup lines
export HISTCONTROL=ignoreboth
export HISTFILESIZE=
export HISTIGNORE="exit:ls:la:lla:ll"
export HISTFILE=$HOME/private_dotfiles/bash/histories/$(hostname)/.bash_history

# flush history to file on each command
export PROMPT_COMMAND='history -a'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=$PATH:$HOME/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting

# go stuff
export GOPATH=$HOME/projects/go
export PATH=$PATH:$HOME/projects/go/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=/usr/bin/vim

# set vim command line editing
# set -o vi

source ~/repos/ansible/hacking/env-setup > /dev/null

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

date >> ~/.bash_history

