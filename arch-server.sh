#!/bin/bash

source ./config.sh

# Configure pacman as we prefer
for s in 's/.*Color$/Color/' 's/.*VerbosePkgLists$/VerbosePkgLists/'; do
  sudo sed -i $s /etc/pacman.conf
done

# install packages
sudo pacman -S --needed \
  arp-scan \
  aws-cli \
  bandwhich \
  base-devel \
  bat \
  clang \
  cmake \
  colordiff \
  cronie \
  ctags \
  diff-so-fancy \
  dmidecode \
  dnsutils \
  docker \
  docker-compose \
  edk2-ovmf \
  emacs \
  exa \
  fd \
  git \
  gnu-netcat \
  gnupg \
  go \
  hdparm \
  htop \
  jq \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  neovim \
  nethogs \
  net-tools \
  nfs-utils \
  ngrep \
  nmap \
  openssh \
  pacman-contrib \
  parted \
  perf \
  prettyping \
  python-pip \
  qemu \
  readline \
  ripgrep \
  rsync \
  rustup \
  smartmontools \
  socat \
  sshfs \
  sshpass \
  strace \
  sudo \
  sysbench \
  sysdig \
  sysstat \
  tar \
  tcpdump \
  tiptop \
  tmux \
  traceroute \
  tree \
  ttf-dejavu \
  ufw \
  units \
  unzip \
  usbutils \
  vagrant \
  wget \
  wireguard-lts \
  wireguard-tools \
  whois \
  zip \
  zsh

# Install the stable toolchain so that we can run builds.
rustup default stable

sudo ln -fs "$(command -v nvim)" /usr/local/bin/vim

sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw status
sudo ufw default deny
sudo ufw limit ssh
sudo ufw status
sudo ufw enable

# Install the neovim python3 interface
python -m pip install --user --upgrade pynvim

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker "$(whoami)"

# Install yay for managing AUR packages
if which yay; then
  yay -Sua \
    --answerdiff None \
    --answeredit None \
    --answerclean NotInstalled \
    --answerupgrade None
else
  rm -rf /tmp/yay-bin
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  (cd /tmp/yay-bin && makepkg -sric --needed)
fi

yay -S --needed \
  --answerdiff None \
  --answeredit None \
  --answerclean NotInstalled \
  --answerupgrade None \
  aws-vault \
  networkmanager-l2tp \
  ngrok \
  stress-ng \
  wrk \
  yq2-bin

