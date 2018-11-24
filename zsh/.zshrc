# Path to your oh-my-zsh installation.
export ZSH=/home/$(whoami)/.oh-my-zsh

# Disable bell in X
if [ "$TERM" != "linux" ]; then
  xset -b
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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Keep them the same for now
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

setopt HIST_IGNORE_DUPS
setopt interactivecomments
bindkey -e

HISTFILE=$HOME/.zsh_history
HISTSIZE=500000000
SAVEHIST=500000000

PATH=$HOME/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias be="bundle exec"
alias cat=bat
alias c=clear
alias cdd="cd ~/Downloads"
alias dc=docker-compose
alias dm=docker-machine
alias ff=freight-forwarder
alias fprint="ssh-keygen -l -E md5 -f"
alias kgp="kubectl get po -o wide"
alias kgy="kubectl get po -o yaml"
alias k="kubectl"
alias lla="ls -lah"
alias ll="ls -lh"
alias ping="prettyping --nolegend"
alias rc=rancher-compose
alias s="subl3"
alias tf="terraform"
alias tree="tree -I node_modules"
alias vim=nvim

# Python nonsense
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
source $HOME/.nvm/nvm.sh

func dm-devbox ()
{
  export DOCKER_TLS_VERIFY=1;
  export DOCKER_CERT_PATH="/home/jackb/benjamin/.docker/certs/client/dev";
  export DOCKER_HOST="tcp://dp-jackb01-dev.sea1.office.priv:2376"
}

PATH=/data/go/bin:/usr/local/go/bin:$PATH
export GOPATH=/data/go

# added by travis gem
[ -f /home/jackb/.travis/travis.sh ] && source /home/jackb/.travis/travis.sh

#source ~/dotfiles/zsh/extensions/aws.zsh

if (( $+commands[tag] )); then
	tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
	alias ag=tag
fi

[[ -f /tmp/.ssh-agent ]] || ssh-agent > /tmp/.ssh-agent 2>/dev/null
chmod 0400 /tmp/.ssh-agent
source /tmp/.ssh-agent > /dev/null

source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/jackb/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/jackb/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/jackb/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/jackb/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh