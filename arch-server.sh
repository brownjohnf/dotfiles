#!/bin/bash

source ./config.sh

# Configure pacman as we prefer
for s in 's/.*Color$/Color/' 's/.*VerbosePkgLists$/VerbosePkgLists/'; do
  sudo sed -i $s /etc/pacman.conf
done

sudo pacman -S --needed --noconfirm pacman-contrib

# Make sure our mirrors are current
MIRRORLIST_URL="https://www.archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on"
echo "Updating mirror list"
curl -sL "$MIRRORLIST_URL" | \
    sed -e 's/^#Server/Server/' -e '/^#/d' | \
    rankmirrors -n 5 - > /tmp/mirrorlist \
  && sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist


# install packages
sudo pacman -S --needed --noconfirm \
  arp-scan \
  aws-cli \
  bandwhich \
  base-devel \
  bat \
  cargo-watch \
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
  hexyl \
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
  --noremovemake \
  --answerdiff None \
  --answeredit None \
  --answerclean NotInstalled \
  --answerupgrade None \
  archlinux-nix \
  aws-vault \
  networkmanager-l2tp \
  ngrok \
  nix \
  stress-ng \
  tiptop \
  wrk \
  yq2-bin

# Set up nix
# This will bootstrap a group to build packages.
sudo archlinux-nix setup-build-group
# Set up the directory structure we need.
sudo archlinux-nix bootstrap
# Add the unstable channel, and update it.
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
# Update the root channel, even though we don't really want to use it. This will
# silence warnings.
sudo nix-channel --update
