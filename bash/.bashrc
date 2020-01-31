[[ $- == *i* ]] || return

#setxkbmap -variant dvorak

export TERM=xterm-color
#export COLORTERM=gnome-256
. ~/.aliases
. ~/.bash_prompts

# ignore dup lines
export HISTCONTROL=ignoreboth
export HISTFILESIZE=
export HISTIGNORE="exit:ls:la:lla:ll"

export HISTFILE=$HOME/.bash_history

# flush history to file on each command
export PROMPT_COMMAND='history -a'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# Add the go bin path
[[ -d "$HOME/go/bin" ]] && export PATH="$HOME/go/bin:$PATH"

# Add custom binpath
export PATH="$HOME/dotfiles/bin:$PATH"

export EDITOR=/usr/bin/vim

# set vim command line editing
# set -o vi

export TERMINAL='/usr/bin/xfce4-terminal'
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config

# added by travis gem
[ -f /home/jackb/.travis/travis.sh ] && source /home/jackb/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
