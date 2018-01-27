#!/bin/bash

sudo add-apt-repository ppa:linvinus/altyo -y
sudo add-apt-repository ppa:jonathonf/vim -y

sudo apt update && sudo apt install curl altyo git tmux vim zsh build-essential cmake openvpn libssl-dev silversearcher-ag xclip zsh-antigen python-dev fonts-powerline -y

#python3-dev ?

# yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#-----

chsh -s $(which zsh)

#nerd-font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
#---------
