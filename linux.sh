#!/bin/bash

set -x
set -e

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/bin

if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo "--> Updating vundle..."
  (cd $HOME/.vim/bundle/Vundle.vim && git pull --rebase origin master)
else
  echo "--> Installing Vundle..."
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

# bash
ln -fs $HERE/bash/.bash_aliases $HOME/.bash_aliases
ln -fs $HERE/bash/.bash_profile $HOME/.bash_profile
ln -fs $HERE/bash/.bash_prompts $HOME/.bash_prompts
ln -fs $HERE/bash/.bash_logout $HOME/.bash_logout
ln -fs $HERE/bash/.bashrc $HOME/.bashrc
touch $HOME/.bash_history

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
  (cd $HOME/.rbenv && git pull)
else
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# sublime
mkdir -p $HOME/.config/sublime-text-3/Packages/User
ln -fs $HERE/sublime/.sublime/Preferences.sublime-settings \
  $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# custom binaries
mkdir -p $binpath
for binary in genpass zap copy docker.sh vault psgrep muxme set-ssh-perms rebase.sh; do
  ln -fs $HERE/bin/$binary      $binpath/$binary
done

# i3
if [ -f /etc/i3status.conf ]; then
  mkdir -p $HOME/.i3
  ln -fs $HERE/i3/.i3/config $HOME/.i3/config
  if [ -f $HOME/.i3status.conf ]; then
    echo "--> i3status config already in place; skipping."
  else
    echo "--> Adding $HOME/.i3status config file"
    cp /etc/i3status.conf $HOME/.i3status.conf
  fi
fi

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

# oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Docker Machine
[[ -f /usr/local/bin/docker-machine-0.3.0 ]] || sudo sh -c "
curl -L https://github.com/docker/machine/releases/download/v0.3.0/docker-machine_linux-amd64 > \
  /usr/local/bin/docker-machine-0.3.0 && \
  chmod +x /usr/local/bin/docker-machine-0.3.0
"
[[ -f /usr/local/bin/docker-machine-0.4.0 ]] || sudo sh -c "
curl -L https://github.com/docker/machine/releases/download/v0.4.0/docker-machine_linux-amd64 > \
  /usr/local/bin/docker-machine-0.4.0 && \
  chmod +x /usr/local/bin/docker-machine-0.4.0
"
sudo ln -fs /usr/local/bin/docker-machine-0.4.0 /usr/local/bin/docker-machine

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
sudo sh -c "
curl -L https://get.docker.com/builds/Linux/x86_64/$binary \
  > /usr/local/bin/$binary && \
  chmod +x /usr/local/bin/$binary
"
done
