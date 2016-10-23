# link .vimrc and .vim into your home folder
if [ ! -f ~/.vimrc ]; then
  ln -s ${PWD}/vimrc ~/.vimrc
fi
if [ ! -d ~/.vim ]; then
  ln -s ${PWD}/vim ~/.vim
fi

# link default configuration for ycm
if [ ! -f ~/.ycm_extra_conf.py ]; then
  ln -s ${PWD}/ycm_extra_conf.py ~/.ycm_extra_conf.py
fi

# ensure vundle availability
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install all plugins
mvim +PluginInstall +qall

# install YouCompleteMe
# ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --gocode-completer
