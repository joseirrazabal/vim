#!/bin/bash

sudo apt update && sudo apt install curl git tmux vim zsh build-essential cmake libssl-dev silversearcher-ag xclip zsh-antigen fzf -y

ln -sfn ~/.configuracion/vim/vimrc ~/.vimrc
ln -sfn ~/.configuracion/tmux/tmux.conf ~/.tmux.conf
ln -sfn ~/.configuracion/shell/zshrc ~/.zshrc
ln -sfn ~/.configuracion/shell/zshenv ~/.zshenv
ln -sfn ~/.configuracion/shell/exports.zsh ~/.exports.zsh
ln -sfn ~/.configuracion/shell/aliases.zsh ~/.aliases.zsh
ln -sfn ~/.configuracion/shell/antigen.zsh ~/.antigen.zsh
ln -sfn ~/.configuracion/git/gitconfig ~/.gitconfig

mkdir -p ~/.config/hypr ~/.local/bin

for file in hyprland monitors input bindings looknfeel autostart; do
  ln -sfn ~/.configuracion/system/hypr/$file.lua ~/.config/hypr/$file.lua
done

ln -sfn ~/.configuracion/bin/omarchy-toggle-performance ~/.local/bin/omarchy-toggle-performance

chsh -s $(which zsh)
