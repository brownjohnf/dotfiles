# for login shells:

# set the displays
if [ -f $HOME/.displays ]; then
  . $HOME/.displays
fi

# add the date to bash history, for locating when things were executed
date >> ~/.bash_history

# source .bashrc
source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
