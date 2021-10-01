#!/bin/bash

# Copy dotfiles
#./copy.sh

# Update Ubuntu and get standard repository programs
echo "Updating & Upgrading..."
sudo apt update &> /dev/null
sudo apt full-upgrade -y &> /dev/null

function install {
  #which $1 &> /dev/null
  dpkg -s $1 &> /dev/null

  #if [ $? -ne 0 ]; then
  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1 &> /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
#install awscli
#install chrome-gnome-shell
install curl
install exfat-utils
install file
install git
install htop
install nmap
#install openvpn
install tree
install vim
install wget

install neofetch
install ripgrep
install cmatrix
install lolcat
install cowsay
install nodejs
install npm
install rustc
install libnotify-bin

# Image processing
#install gimp
#install jpegoptim
#install optipng

# Run all scripts in programs/
#for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
#echo "Upgrading..."
#sudo apt upgrade -y &> /dev/null
echo "Autoremoving unused packages..."
sudo apt autoremove -y &> /dev/null
