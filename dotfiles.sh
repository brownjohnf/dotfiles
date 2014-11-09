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
      'base')
        echo '--> Installing dependencies...'
        sudo apt-get update && sudo apt-get install aptitude
        sudo aptitude update
        sudo aptitude install -y vim curl htop wget screen git alsa-base \
          alsa-tools alsa-utils build-essential leafpad \
          chromium-browser cryptsetup pcmanfm dkms ecryptfs-utils \
          vlc libreadline-dev firefox nethogs iotop iftop xsel
        ;;
      'i3')
        sudo aptitude install -y i3 i3-wm i3lock i3status xinit x11-xserver-utils \
          xfce4-terminal
        ;;
      'sublime')
        curl "http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3065_amd64.deb" > /tmp/sublime.deb
        sudo dpkg -i /tmp/sublime.deb
        ;;
      'docker')
        curl -sSL https://get.docker.io/ubuntu/ | sudo sh -
        ;;
      'hipchat')
        sudo sh -c "echo deb http://downloads.hipchat.com/linux/apt stable main \
          > /etc/apt/sources.list.d/atlassian-hipchat.list"
        sudo sh -c "wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -"
        sudo aptitude update
        sudo aptitude install -y hipchat
        ;;
      'spotify')
        sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list'
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
        sudo aptitude update
        sudo aptitude install -y spotify-client
        ;;
      '3d')
        sudo aptitude install -y python-numpy python-opengl openscad python-wxgtk2.8
        curl http://software.ultimaker.com/current/cura_14.07-debian_amd64.deb > /tmp/cura.deb
        sudo dpkg -i /tmp/cura.deb
        ;;
      'fig')
        sudo sh -c 'curl -L https://github.com/docker/fig/releases/download/1.0.0/fig-Linux-x86_64 > /usr/local/bin/fig'
        sudo sh -c 'chmod +x /usr/local/bin/fig'
        ;;
      'all')
        $0 install base
        $0 install i3
        $0 install sublime
        $0 install docker
        $0 install hipchat
        $0 install spotify
        $0 install 3d
        $0 setup all
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
        sudo usermod -aG dialout $USER
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

        if [ -f $HOME/.i3status.conf ]; then
          echo "--> i3status config already in place; skipping."
        else
          cp $HERE/i3/.i3status.conf $HOME/.i3status.conf
        fi

        if [ -f $HOME/.displays ]; then
          echo "--> displays config already in place; skipping."
        else
          cp $HERE/x/.displays $HOME/.displays
        fi

        echo "==> Set up i3 WM. Edit ~/.i3status.conf to set up networking stats:"
        ifconfig | egrep '^\w+' | awk '{print $1}'
        ;;
      'terminal')
        mkdir -p $HOME/.config/xfce4/terminal
        ln -fs $HERE/terminal/xfce4/terminalrc $HOME/.config/xfce4/terminal/terminalrc
        ;;
      'bin')
        mkdir -p $HOME/bin
        ln -fs $HERE/bin/emount.sh $HOME/bin/emount.sh
        ln -fs $HERE/bin/eumount.sh $HOME/bin/eumount.sh
        ln -fs $HERE/bin/cryptmake.sh $HOME/bin/cryptmake.sh
        ln -fs $HERE/bin/memreport.sh $HOME/bin/memreport.sh
        ln -fs $HERE/bin/spark $HOME/bin/spark
        ln -fs $HERE/bin/genpass $HOME/bin/genpass
        ln -fs $HERE/bin/zap $HOME/bin/zap
        ln -fs $HERE/bin/copy $HOME/bin/copy
        ln -fs $HERE/bin/docker.sh $HOME/bin/docker.sh
        ;;
      'docker')
        sudo usermod -aG docker $USER
        ;;
      'all')
        $0 setup bash
        $0 setup polipo
        $0 setup vim
        $0 setup git
        $0 setup ruby
        $0 setup mongo
        $0 setup sublime
        $0 setup ssh
        $0 setup i3
        $0 setup terminal
        $0 setup bin
        $0 setup docker
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
