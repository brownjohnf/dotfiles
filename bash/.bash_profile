# for login shells:

# set the displays
if [ -f $HOME/.displays ]; then
  . $HOME/.displays
fi

# add the date to bash history, for locating when things were executed
date >> ~/.bash_history

# source .bashrc
. ~/.bashrc

if [ -e /home/jackb/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jackb/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
