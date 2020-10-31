#!/bin/bash

VUNDLE_DIR=$HOME/.vim/bundle/Vundle.vim
if [[ ! -d $VUNDLE_DIR ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi

vim +PluginInstall +qall

if [[ ! -d $HOME/.venv/neovim ]]; then
  virtualenv "$HOME"/.venv/neovim
  "$HOME"/.venv/neovim/bin/pip install -r "$DOT_DIR"/home/.ven_defs/neovim
fi

if [[ -d ~/.vim/bundle/YouCompleteMe ]]; then
  cd ~/.vim/bundle/YouCompleteMe
  "$HOME"/.venv/neovim/bin/python3 install.py --all
  cd "$DOT_DIR"
fi
