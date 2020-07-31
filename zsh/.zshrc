# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export HOMEBREW_NO_ANALYTICS=1

# Disable bell in X
if [ "$(uname)" = "Linux" ]; then
  if [ "$TERM" != "linux" ]; then
    xset -b
  fi
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jackb"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Keep them the same for now
if command -v emacsclient > /dev/null; then
  export EDITOR="emacsclient -c"
elif which nvim > /dev/null; then
  export EDITOR=nvim
elif which vim; then
  export EDITOR=vim
else
  export EDITOR=vi
fi

setopt HIST_IGNORE_DUPS
setopt interactivecomments
bindkey -e

HISTFILE=$HOME/.zsh_history
HISTSIZE=500000000
SAVEHIST=500000000



# added by travis gem
[ -f /home/jackb/.travis/travis.sh ] && source /home/jackb/.travis/travis.sh

if (( $+commands[tag] )); then
	tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
	alias ag="tag --ignore 'terraform.tfstate*' --ignore vendor"
fi

# Start the agent if it isn't already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
# Grab the auth sock if it's not already set
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

#[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.local.sh ] && source ~/.local.sh

if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

source $HOME/.aliases

# Use shared libraries when installing python
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Set the minimum backlight to 1%
which light > /dev/null && light -N 1 || true

# Use docker buildkit if available
export DOCKER_BUILDKIT=1
