#!/bin/bash

sudo add-apt-repository ppa:linvinus/altyo -y
sudo add-apt-repository ppa:jonathonf/vim -y

sudo apt update && sudo apt install curl altyo git tmux vim zsh build-essential cmake openvpn libssl-dev silversearcher-ag xclip zsh-antigen python-dev -y

# yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y
#-----

#fonts
sudo apt install fonts-powerline -y

mkdir -p ~/.local/share/fonts

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
# mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.local/share/fonts/

#nerd-font
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
#---------

ln -s ~/.configuracion/vimrc ~/.vimrc
ln -s ~/.configuracion/tmux.conf ~/.tmux.conf
ln -s ~/.configuracion/zshrc ~/.zshrc
ln -s ~/.configuracion/gitconfig ~/.gitconfig

chsh -s $(which zsh)
