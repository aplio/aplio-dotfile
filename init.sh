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

echo "create link for hammerspoon, only works for macOS"
mkdir -p ~/.hammerspoon
backup ~/.hammerspoon/init.lua
ln -sf ${curPath}/hammerspoon/init.lua ~/.hammerspoon/init.lua

echo "create link for tmux"
backup ~/.tmux.conf
ln -sf ${curPath}/tmux/.tmux.conf ~/.tmux.conf

echo "tpm setup"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "override zshrc"
backup ~/.zshrc
ln -sf ${curPath}/zsh/.zshrc ~/.zshrc

echo "create link for alacritty"
mkdir -p ~/.config/alacritty
backup ~/.config/alacritty/alacritty.yml
ln -sf ${curPath}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

