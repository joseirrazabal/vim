sudo aptitude install exuberant-ctags ack-grep vim-youcompleteme git -y

git clone https://github.com/joseirrazabal/vim.git ~/.vim

ln -s ~/.vim/vimrc  ~/.vimrc

cd ~/.vim

git submodule update --init

abrir vim

:PluginInstall
