#!/bin/bash
dotfiles_dir=~/.dotfiles

echo "***"
echo "Basics installation"
echo "***"
sudo apt update && sudo apt upgrade -y 

echo "***"
echo "Basic programs and libs installation"
echo "***"
sudo apt install -y linux-image-amd64 firmware-linux-nonfree curl vim git inxi build-essential zsh tmux ripgrep \
    python3 python3-venv stow bat thefuck xsel libgconf-2-4 libc++1 gconf2-common libc++abi1 graphviz lldb awesome \
    compton nitrogen pavucontrol pamixer playerctl gir1.2-playerctl-2.0 light maim redshift

git clone --depth 1 https://github.com/junegunn/fzf.git $dotfiles_dir/.local/share/.fzf
$dotfiles_dir/.local/share/.fzf/install

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# TODO add alacritty installation from github
cargo install fd-find git-delta eza tlrc

echo "***"
echo "Add additional repos"
echo "***"
# brave
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# spotify
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# docker
## docker's official GPG key
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "***"
echo "Install additional apps"
echo "***"
# install aditional apps
sudo apt update
sudo apt install -y brave-browser spotify-client docker-ce docker-ce-cli containerd.io docker-buildx-plugin \
    docker-compose-plugin

# Neovim latest, as of 07.07.25 it is v0.11.2
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p /opt/nvim
sudo mv ./nvim.appimage /opt/nvim/nvim

# lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
rm -rf lazygit.tar.gz
rm -rf lazygit

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

cd $dotfiles_dir
stow .
ln -s /usr/bin/batcat ~/.local/bin/bat

mkdir -p ~/.local/wallpapers
git clone https://github.com/zhichaoh/catppuccin-wallpapers.git ~/.local/wallpapers/catppuccin-wallpapers

# Bat themes
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

bat cache --build
