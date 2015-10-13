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
if [ -d "/usr/local/heroku/bin" ]; then
  PATH="/usr/local/heroku/bin:$PATH"
fi

# Add the go bin path
if [ -d "$HOME/go/bin" ]; then
  PATH="$HOME/go/bin:$PATH"
fi

# Add the ruby bin dir to path
if [ -d "$HOME/.gem/ruby/2.2.0/bin" ]; then
  PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH=$HOME/bin:$PATH
fi

export EDITOR=/usr/bin/vim

# set vim command line editing
# set -o vi

export TERMINAL='/usr/bin/xfce4-terminal'
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
