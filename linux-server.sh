#!/bin/bash

set -x
set -e

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/bin

# Setup pathogen for vim plugin management
mkdir -p $HOME/.vim/{autoload,bundle}
if [ -d $HOME/.vim/autoload/pathogen.vim ]; then
  echo "--> Pathogen.vim installed."
else
  echo "--> Installing pathogen.vim..."
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install plugins
# NerdTree
if [ -d $HOME/.vim/bundle/nerdtree ]; then
  ( cd $HOME/.vim/bundle/nerdtree && git pull )
else
  echo "--> Installing nerdtree..."
  git clone https://github.com/scrooloose/nerdtree $HOME/.vim/bundle/nerdtree
fi

# ctrlp
if [ -d $HOME/.vim/bundle/ctrlp.vim ]; then
  ( cd $HOME/.vim/bundle/ctrlp.vim && git pull )
else
  echo "--> Installing nerdtree..."
  git clone https://github.com/ctrlpvim/ctrlp.vim $HOME/.vim/bundle/ctrlp.vim
fi

if [ -d $HOME/.vim/bundle/vim-go ]; then
  echo "--> Updating vim-go"
  (cd $HOME/.vim/bundle/vim-go && git pull --rebase origin master)
else
  echo "--> Installing vim-go"
  git clone https://github.com/fatih/vim-go.git $HOME/.vim/bundle/vim-go
fi

if [ -d $HOME/.vim/bundle/nerdtree ]; then
  echo "--> Updating nerdtree"
  (cd $HOME/.vim/bundle/nerdtree && git pull --rebase origin master)
else
  echo "--> Installing nerdtree"
  git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
fi

if [ -d $HOME/.vim/bundle/ctrlp.vim ]; then
  echo "--> Updating ctrlp.vim"
  (cd $HOME/.vim/bundle/ctrlp.vim && git pull --rebase origin master)
else
  echo "--> Installing ctrlp.vim"
  git clone https://github.com/ctrlpvim/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim
fi

# bash
ln -fs $HERE/bash/.bash_aliases $HOME/.bash_aliases
ln -fs $HERE/bash/.bash_profile $HOME/.bash_profile
ln -fs $HERE/bash/.bash_prompts $HOME/.bash_prompts
ln -fs $HERE/bash/.bash_logout $HOME/.bash_logout
ln -fs $HERE/bash/.bashrc $HOME/.bashrc
touch $HOME/.bash_history

# oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install my custom profile(s)
for f in jackb; do
  ln -fs $HERE/zsh/$f.zsh-theme $HOME/.oh-my-zsh/themes/$f.zsh-theme
done

# zsh
for f in .zshrc; do
  ln -fs $HERE/zsh/$f $HOME/$f
done
touch $HOME/.zsh_history

# vim
ln -fs $HERE/vim/.vimrc   ~/.vimrc
ln -fs $HERE/gvim/.gvimrc ~/.gvimrc
mkdir -p $HOME/.vim/colors
ln -fs $HERE/vim/.vim/colors/molokai.vim    $HOME/.vim/colors/molokai.vim
ln -fs $HERE/vim/.vim/colors/solarized.vim  $HOME/.vim/colors/solarized.vim

# tmux
ln -fs $HERE/tmux/.tmux.conf $HOME/.tmux.conf

# git
ln -fs $HERE/git/.git-completion.bash $HOME/.git-completion.bash
ln -fs $HERE/git/.gitconfig           $HOME/.gitconfig

# ruby
ln -fs $HERE/ruby/.irbrc $HOME/.irbrc
touch $HOME/.irb_history

# rbenv
if [ -d $HOME/.rbenv ]; then
  echo '--> Upgrading rbenv...'
  (cd $HOME/.rbenv && git pull --rebase origin master)
else
  echo '--> Installing rbenv...'
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
fi

# rbenv-install
if [ -d $HOME/.rbenv/plugins/ruby-build ]; then
  echo '--> Upgrading rbenv-install...'
  (cd $HOME/.rbenv/plugins/ruby-build && git pull --rebase origin master)
else
  echo '--> Installing rbenv-install'
  git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
  (cd $HOME/.pyenv && git pull)
else
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

# nvm
if [ -d $HOME/.nvm ]; then
  (cd $HOME/.nvm && git fetch)
else
  git clone https://github.com/creationix/nvm.git $HOME/.nvm
fi
(cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`)

# sublime
mkdir -p $HOME/.config/sublime-text-3/Packages/User
ln -fs $HERE/sublime/.sublime/Preferences.sublime-settings \
  $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# custom binaries
mkdir -p $binpath
for binary in genpass zap copy curldiff docker.sh psgrep muxme set-ssh-perms rebase.sh; do
  ln -fs $HERE/bin/$binary      $binpath/$binary
done

# Clean up legacy symlinks for new per-repo install
for binary in vault; do
  [ -h $binpath/$binary ] && rm $binpath/$binary
done

# vault
for util in vault; do
  wget https://raw.githubusercontent.com/brownjohnf/$util/master/bin/$util -O $binpath/$util
  chmod +x $binpath/$util
done

if [ -f $HOME/.i3/config ]; then
  echo "--> .i3 installed"
else
  mkdir -p $HOME/.i3
  ln -fs $HERE/i3/.i3/config $HOME/.i3/config
fi

# i3
if [ -f /etc/i3status.conf ]; then
  if [ -f $HOME/.i3status.conf ]; then
    echo "--> i3status config already in place; skipping."
  else
    echo "--> Adding $HOME/.i3status config file"
    cp /etc/i3status.conf $HOME/.i3status.conf
  fi
fi

# Docker Machine
for version in 0.3.0 0.4.0; do
  [[ -f "/usr/local/bin/docker-machine-$version" ]] || sudo sh -c "
  curl -L https://github.com/docker/machine/releases/download/v$version/docker-machine_linux-amd64 > \
    /usr/local/bin/docker-machine-$version && \
    chmod +x /usr/local/bin/docker-machine-$version
  "
done

if [ "$(docker-machine --version | grep '0.5.0' | wc -l)" != "1" ]; then
  rm -f /tmp/docker-machine*
  curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip > /tmp/machine.zip && \
  unzip /tmp/machine.zip && \
  rm /tmp/machine.zip && \
  sudo mv docker-machine* /usr/local/bin
  rm -f /tmp/docker-machine*
fi

# Docker Compose
[[ -f /usr/local/bin/docker-compose-1.3.1 ]] || sudo sh -c "
curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-Linux-x86_64 \
  > /usr/local/bin/docker-compose-1.3.1 && \
  chmod +x /usr/local/bin/docker-compose-1.3.1
"
[[ -f /usr/local/bin/docker-compose-1.4.0 ]] || sudo sh -c "
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-Linux-x86_64 \
  > /usr/local/bin/docker-compose-1.4.0 && \
  chmod +x /usr/local/bin/docker-compose-1.4.0
"
sudo ln -fs /usr/local/bin/docker-compose-1.4.0 /usr/local/bin/docker-compose

# Rancher Compose
# sudo sh -c "
# curl -L https://releases.rancher.com/compose/latest/rancher-compose-linux-amd64.tar.gz \
#  > /tmp/rancher-compose.tar.gz && \
#  cp /tmp/rancher-compose/rancher-compose /usr/local/bin/rancher-compose && \
#  /usr/local/bin/rancher-compose && \
#  chmod +x /usr/local/bin/rancher-compose
#"

# legacy docker versions for compatibility
for binary in docker-1.6.2; do
  [[ -f /usr/local/bin/$binary ]] || sudo sh -c "
  curl -L https://get.docker.com/builds/Linux/x86_64/$binary \
    > /usr/local/bin/$binary && \
    chmod +x /usr/local/bin/$binary
  "
done

echo "SUCCESS"

