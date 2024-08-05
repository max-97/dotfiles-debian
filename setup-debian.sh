#!/bin/bash
echo "***"
echo "Basics installation"
echo "***"
apt update && apt upgrade -y 

# install basics
apt install -y linux-image-amd64 firmware-linux-nonfree curl vim git inxi
echo "***"
echo "Add additioal repos"
echo "***"
# brave
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# install apps
apt update
apt install -y brave-browser
