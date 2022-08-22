#!/bin/bash
set -eo pipefail

curPath=`pwd`
function backup() {
    if [ -e $1 ]
        then cp $1 $1_
    else
        echo $1 'not found, skip backup'
    fi
}

echo "install brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "create link for hammerspoon, only works for macOS"
mkdir -p ~/.hammerspoon
backup ~/.hammerspoon/init.lua
ln -sf ${curPath}/hammerspoon/init.lua ~/.hammerspoon/init.lua

echo "create link for tmux"
backup ~/.tmux.conf
ln -sf ${curPath}/tmux/.tmux.conf ~/.tmux.conf

# starship
# https://starship.rs/ja-jp/guide/
echo "install starship"
sudo mkdir -p /usr/local/bin
curl -sS https://starship.rs/install.sh | sh


echo "tpm setup"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "override zshrc"
backup ~/.zshrc
ln -sf ${curPath}/zsh/.zshrc ~/.zshrc

echo "create link for alacritty"
mkdir -p ~/.config/alacritty
backup ~/.config/alacritty/alacritty.yml
ln -sf ${curPath}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "reset path for now"
source ~/.zshrc

echo "install tmux"
brew install tmux

echo "install ghq"
brew install ghq
