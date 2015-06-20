#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin


# bash
ln -fs $HERE/bash/.bash_aliases $HOME/.bash_aliases
ln -fs $HERE/bash/.bash_profile $HOME/.bash_profile
ln -fs $HERE/bash/.bash_prompts $HOME/.bash_prompts
ln -fs $HERE/bash/.bash_logout $HOME/.bash_logout
ln -fs $HERE/bash/.bashrc $HOME/.bashrc
touch $HOME/.bash_history

# vim
ln -fs $HERE/vim/.vimrc ~/.vimrc
ln -fs $HERE/gvim/.gvimrc ~/.gvimrc
mkdir -p $HOME/.vim/colors
ln -fs $HERE/vim/.vim/colors/molokai.vim $HOME/.vim/colors/molokai.vim
ln -fs $HERE/vim/.vim/colors/solarized.vim $HOME/.vim/colors/solarized.vim

# tmux
ln -fs $HERE/tmux/.tmux.conf $HOME/.tmux.conf

# git
ln -fs $HERE/git/.git-completion.bash $HOME/.git-completion.bash
ln -fs $HERE/git/.gitconfig $HOME/.gitconfig

# ruby
ln -fs $HERE/ruby/.irbrc $HOME/.irbrc
touch $HOME/.irb_history

# sublime
mkdir -p $HOME/.config/sublime-text-3/Packages/User
ln -fs $HERE/sublime/.sublime/Preferences.sublime-settings \
  $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# ssh
mkdir -p $HOME/.ssh
ln -fs $HERE/ssh/config $HOME/.ssh/config
chmod -R 0600 $HOME/.ssh/config

# custom binaries
mkdir -p $binpath
ln -fs $HERE/bin/genpass      $binpath/genpass
ln -fs $HERE/bin/zap          $binpath/zap
ln -fs $HERE/bin/copy         $binpath/copy
ln -fs $HERE/bin/docker.sh    $binpath/docker.sh
ln -fs $HERE/bin/vault        $binpath/vault

# i3
mkdir -p $HOME/.i3
ln -fs $HERE/i3/.i3/config $HOME/.i3/config
if [ -f $HOME/.i3status.conf ]; then
  echo "--> i3status config already in place; skipping."
else
  echo "--> Adding $HOME/.i3status config file"
  cp /etc/i3status.conf $HOME/.i3status.conf
fi
