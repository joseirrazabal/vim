sudo aptitude install build-essential cmake exuberant-ctags ack-grep python-dev python3-dev vim-youcompleteme  -y

git clone https://github.com/joseirrazabal/vim.git ~/.vim

ln -s ~/.vim/vimrc  ~/.vimrc

cd ~/.vim

git submodule update --init

~/.vim/bundle/YouCompleteMe/install.py

abrir vim

:PluginInstall
