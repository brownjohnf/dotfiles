#!/bin/bash
U=$(whoami)
G=$(id -gn)

echo "You appear to be $U, acting in the $G group."

echo "--> Performing system-specific config..."
if [ `uname` == "Darwin" ]; then
  echo "--> System appears to be OS X..."
  echo "--> copying system-specific files..."
  ln -fs ~/dotfiles/.sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
  echo "    System files complete."
  echo "--> Forcing symlinked files into home folder..."

  # ln -fs ~/dotfiles/.monk ~/.monk
  # ln -fs ~/dotfiles/.oh-my-fish ~/.oh-my-fish
  # ln -fs ~/dotfiles/.tugboat ~/.tugboat
  # ln -fs ~/dotfiles/.zprofile ~/.zprofile
  # ln -fs ~/dotfiles/.zshrc ~/.zshrc
  echo "    File symlinks complete."

  echo "--> Deleting & symlinking directories in home folder..."
  # mkdir -p ~/.config/fish/functions
  # ln -fs ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
  # ln -fs ~/dotfiles/.config/fish/functions/gis.fish ~/.config/fish/functions/gis.fish
  # ln -fs ~/dotfiles/.config/fish/functions/ll.fish ~/.config/fish/functions/ll.fish

  rm -rf ~/.filezilla
  ln -fs ~/dotfiles/.filezilla ~/.filezilla

  rm -rf ~/.gnupg
  ln -fs ~/dotfiles/.gnupg ~/.gnupg

  # rm -rf ~/.oh-my-fish
  # ln -fs ~/dotfiles/.oh-my-fish ~/.oh-my-fish

  echo "    Folder symlinks complete."


  echo "--> Installing authorized_keys..."
  if [ -f ~/.ssh/authorized_keys ]; then
    if [ ! "$(cat ~/.ssh/authorized_keys) == $(cat ~/dotfiles/.ssh/authorized_keys)" ]; then
      cat ~/dotfiles/.ssh/authorized_keys >> ~/.ssh/authorized_keys
    fi
  else
    mkdir -p ~/.ssh
    ln -rf ~/dotfiles/.ssh/authorized_keys ~/.ssh/authorized_keys
  fi
  echo "    authorized_keys installed."

elif [ `uname -a | grep Ubuntu | wc -l` -gt 0 ]; then
  echo "--> System appears to be Ubuntu..."
  #echo "--> Updating apt and installing base packages; sudo password required..."
  #DEBIAN_FRONTEND=noninteractive sudo aptitude update > /dev/null
  #DEBIAN_FRONTEND=noninteractive sudo aptitude install -y vim curl htop git > /dev/null

  echo "--> Forcing symlinked files into home directory..."
  mkdir -p ~/.config/sublime-text-3/Packages/User
  ln -fs ~/dotfiles/.sublime/Preferences.sublime-settings \
    ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

  echo "    File symlinks complete."
fi

echo "--> Performing generic UNIX bootstrap..."
sudo ln -fs ~/dotfiles/hosts /etc/hosts

ln -fs ~/dotfiles/.pinerc ~/.pinerc
ln -fs ~/dotfiles/.ssh/config ~/.ssh/config

echo "--> Setting up authorized keys..."
# mkdir -p ~/.ssh
# cat ~/dotfiles/.ssh/authorized_keys >> ~/.ssh/authorized_keys


# hosts
sudo ln -fs ~/dotfiles/hosts /etc/hosts

sudo mkdir -p /etc/ansible
sudo ln -fs ~/dotfiles/ansible/hosts /etc/ansible/hosts
echo "    Generic bootstrap complete."

echo "==> Bootstrapping complete."

