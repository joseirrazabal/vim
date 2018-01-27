#!/bin/bash

sudo add-apt-repository ppa:linvinus/altyo
sudo add-apt-repository ppa:jonathonf/vim

sudo apt update && sudo apt install curl altyo git tmux vim zsh build-essential cmake openvpn libssl-dev silversearcher-ag xclip zsh-antigen -y

# yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

chsh -s $(which zsh)


#sudo apt-get install powerline

#// necesario ?
#pip install powerline-status

#o (es lo mismo)
#sudo apt-get install fonts-powerline

#// nerd-font necesario ?
#mkdir -p ~/.local/share/fonts
