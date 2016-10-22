# link .vimrc and .vim into your home folder
ln -s vimrc ~/.vimrc
ln -s vim ~/.vim

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install all plugins
vim +PluginInstall +qall
