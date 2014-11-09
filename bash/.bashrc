[[ $- == *i* ]] || return

#setxkbmap -variant dvorak

export TERM=xterm-color
#export COLORTERM=gnome-256
. ~/.bash_aliases
. ~/.bash_prompts

# ignore dup lines
export HISTCONTROL=ignoreboth
export HISTFILESIZE=
export HISTIGNORE="exit:ls:la:lla:ll"

if [ -f $HOME/private_dotfiles/bash/histories/$(hostname)/.bash_history ]; then
  export HISTFILE=$HOME/private_dotfiles/bash/histories/$(hostname)/.bash_history
else
  export HISTFILE=$HOME/.bash_history
fi

# flush history to file on each command
export PROMPT_COMMAND='history -a'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add the go bin path
export PATH="$HOME/go/bin:$PATH"

export EDITOR=/usr/bin/vim

# set vim command line editing
set -o vi
