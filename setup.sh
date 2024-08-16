#!/bin/bash
dotfiles_dir=~/.dotfiles

echo "***"
echo "Basics installation"
echo "***"
sudo apt update && sudo apt upgrade -y 

echo "***"
echo "Basic programs and libs installation"
echo "***"
sudo apt install -y linux-image-amd64 firmware-linux-nonfree curl vim git inxi build-essential zsh tmux ripgrep python3 python3-venv stow bat

git clone --depth 1 https://github.com/junegunn/fzf.git $dotfiles_dir/.local/share/.fzf
$dotfiles_dir/.local/share/.fzf/install

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

cargo install fd-find

echo "***"
echo "Add additional repos"
echo "***"
# brave
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "***"
echo "Install additional apps"
echo "***"
# install aditional apps
sudo apt update
sudo apt install -y brave-browser

# Neovim latest, as of 05.08.24 it is v0.10.1
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p /opt/nvim
sudo mv ./nvim.appimage /opt/nvim/nvim

# NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
rm -rf lazygit.tar.gz
rm -rf lazygit

cd $dotfiles_dir
stow .
ln -s /usr/bin/batcat ~/.local/bin/bat

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
