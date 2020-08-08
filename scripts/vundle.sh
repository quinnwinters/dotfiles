#!/bin/bash 

VUNDLE_DIR=~/.vim/bundle/Vundle.vim
if [[ ! -d $VUNDLE_DIR ]] ; then 
   git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi

vim +PluginInstall +qall

if [[ -d ~/.vim/bundle/YouCompleteMe ]] ; then 
  cd ~/.vim/bundle/YouCompleteMe
  python3 install.py --all 
  cd "$DOT_DIR"
fi
