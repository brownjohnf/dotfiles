#!/bin/bash

set -euo pipefail
set -x

source ./config.sh

# Setup tmux plugin manager for tmux plugin management
mkdir -p $HOME/.tmux/plugins
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  echo "--> Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

mkdir -p $HOME/.vim/autoload

# Setup vim-plug for plugin management
if [ ! -d $HOME/.vim/autoload/plug.vim ]; then
  echo "--> Installing plug.vim..."
  curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# bash
ln -fs $HERE/bash/.bash_profile $HOME/.bash_profile
ln -fs $HERE/bash/.bash_prompts $HOME/.bash_prompts
ln -fs $HERE/bash/.bash_logout $HOME/.bash_logout
ln -fs $HERE/bash/.bashrc $HOME/.bashrc
touch $HOME/.bash_history

# oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# aliases
ln -fs $HERE/aliases.sh $HOME/.aliases

# Install my custom profile(s)
for f in jackb; do
  ln -fs $HERE/zsh/$f.zsh-theme $HOME/.oh-my-zsh/themes/$f.zsh-theme
done

# zsh
for f in .zshrc .zshenv; do
  ln -fs $HERE/zsh/$f $HOME/$f
done
touch $HOME/.zsh_history

# vim
ln -fs $HERE/vim/.vimrc   ~/.vimrc
ln -fs $HERE/gvim/.gvimrc ~/.gvimrc
mkdir -p $HOME/.vim/colors
ln -fs $HERE/vim/.vim/colors/molokai.vim    $HOME/.vim/colors/molokai.vim
ln -fs $HERE/vim/.vim/colors/solarized.vim  $HOME/.vim/colors/solarized.vim

# neovim
mkdir -p $HOME/.config/nvim
ln -fs $HERE/neovim/init.vim $HOME/.config/nvim/init.vim

# emacs
#mkdir -p $HOME/.emacs.d
#ln -fs $HERE/emacs/init.el $HOME/.emacs.d/init.el
[[ -d $HOME/.emacs.d ]] || (
  git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d && \
    $HOME/.emacs.d/bin/doom install)
ln -fs $HERE/doom $HOME/.doom.d

# tmux
ln -fs $HERE/tmux/.tmux.conf $HOME/.tmux.conf

# git
ln -fs $HERE/git/.git-completion.bash $HOME/.git-completion.bash
ln -fs $HERE/git/.gitconfig           $HOME/.gitconfig
ln -fs $HERE/git/.gitignore           $HOME/.gitignore

# ruby
ln -fs $HERE/ruby/.irbrc $HOME/.irbrc
touch $HOME/.irb_history

if [ ! -d $HOME/.asdf ]; then
  echo "--> Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.0
fi

# myvault
sudo wget \
  https://raw.githubusercontent.com/brownjohnf/vault/master/bin/vault \
  -O /usr/local/bin/myvault
sudo chmod +x /usr/local/bin/myvault

echo "SUCCESS"
