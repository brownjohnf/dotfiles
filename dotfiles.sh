#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"

if [ `uname | grep Linux | wc -l` -lt 1 ]; then
  echo "You must be on a Linux system."
  exit
fi

if [ $# -lt 1 ]; then
  echo "Usage: $0 <install> <all>"
  exit
fi

case "$1" in
  'install')
    case "$2" in
      'deps')
        echo '--> Installing dependencies...'
        sudo aptitude update
        sudo aptitude install -y vim curl htop wget screen
        ;;
      'git')
        sudo aptitude install -y git
        ;;
      'i3')
        sudo aptitude install -y i3 i3-wm i3lock i3status xinit
        ;;
      'sublime')
        echo 'INSTALL SUBLIME !!'
        ;;
      *)
        $0 install deps
        $0 install git
        $0 setup
        ;;
    esac
    ;;
  'setup')
    case "$2" in
      'bash')
        echo '--> Installing bash dotfiles...'
        ln -fs $HERE/bash/.bash_aliases $HOME/.bash_aliases
        ln -fs $HERE/bash/.bash_profile $HOME/.bash_profile
        ln -fs $HERE/bash/.bash_prompts $HOME/.bash_prompts
        ln -fs $HERE/bash/.bash_logout $HOME/.bash_logout
        ln -fs $HERE/bash/.bashrc $HOME/.bashrc
        touch $HOME/.bash_history
        ;;
      'polipo')
        echo '--> Installing polipo dotfiles...'
        ln -fs $HERE/polipo/.polipo $HOME/.polipo
        ;;
      'vim')
        echo '--> Installing vim dotfiles...'
        ln -fs $HERE/vim/.vimrc ~/.vimrc
        ln -fs $HERE/gvim/.gvimrc ~/.gvimrc
        mkdir -p $HOME/.vim/colors
        ln -fs $HERE/vim/.vim/colors/molokai.vim $HOME/.vim/colors/molokai.vim
        ln -fs $HERE/vim/.vim/colors/solarized.vim $HOME/.vim/colors/solarized.vim
        ;;
      'git')
        echo '--> Installing git dotfiles...'
        ln -fs $HERE/git/.git-completion.bash $HOME/.git-completion.bash
        ln -fs $HERE/git/.gitconfig $HOME/.gitconfig
        ;;
      'ruby')
        echo '--> Installing ruby dotfiles...'
        ln -fs $HERE/ruby/.irbrc $HOME/.irbrc
        touch $HOME/.irb_history
        ;;
      'mongo')
        ln -fs $HERE/mongo/.mongorc.js $HOME/.mongorc.js
        ;;
      'sublime')
        echo "--> Installing Sublime dotfiles..."
        echo "--> Forcing symlinked files into home directory..."
        mkdir -p $HOME/.config/sublime-text-3/Packages/User
        ln -fs $HERE/sublime/.sublime/Preferences.sublime-settings \
          $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
        ;;
      'ssh')
        echo '--> Ensuring ssh directory is present...'
        mkdir -p $HOME/.ssh
        ;;
      'i3')
        echo '--> Setting up X...'
        ln -fs $HERE/x/.xinitrc $HOME/.xinitrc
        echo '--> Setting up i3 config...'
        mkdir -p $HOME/.i3
        ln -fs $HERE/i3/.i3/config $HOME/.i3/config
        cp $HERE/i3/.i3status.conf $HOME/.i3status.conf
        echo "==> Set up i3 WM. Edit ~/.i3status.conf to set up networking stats:"
        ifconfig | egrep '^\w+' | awk '{print $1}'
        ;;
      *)
        $0 setup bash
        $0 setup polipo
        $0 setup vim
        $0 setup git
        $0 setup ruby
        $0 setup mongo
        $0 setup sublime
        $0 setup ssh
        $0 setup i3
        ;;
    esac
    ;;
  'system')
    if [ `uname -a | grep Ubuntu | wc -l` -gt 0 ]; then
      echo "Ubuntu"
    elif [ `uname -a | grep Fedora | wc -l` -gt 0 ]; then
      echo "Fedora"
    else
      echo "Can't determine Linux version. Pass SYSTEM."
    fi
    ;;
  *)
    echo "Don't know that one!"
    ;;
esac
