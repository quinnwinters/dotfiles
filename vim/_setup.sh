#!/bin/bash
pyver=$(python3 --version 2>&1)
if [[ $? != 0 ]] ; then
  echo "Installing python3"
  brew install python3
fi

nvimver=$(nvim --version 2>&1)
if [[ $? != 0 ]] ; then 
  echo "Installing neovim"
  brew install neovim
fi 

CFG=~/.config/nvim/
if [[ -d $CFG ]]; then
  echo "Neovim initialization directory is already present. Skipping setup"
else
  echo "Setting up neovim configuration"
  mkdir -p "$CFG"
  cat ./vim/init.vim.template >"$CFG"/init.vim
fi

VNDL=~/.vim/bundle/Vundle.vim
if [[ -d $VNDL ]]; then
  echo "Vundle is already installed. Skipping installation"
else
  echo "Installing Vundle Package Manager"
  git clone https://github.com/VundleVim/Vundle.vim.git "$VNDL"
fi

ln -sf $(pwd)/vim_runtime ~/.vim_runtime
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim
ln -sf $(pwd)/editorconfig ~/.editorconfig
ln -sf $(pwd)/vimrc ~/.vimrc 

vim +PluginInstall +qall
CUR_DIR=$PWD
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
cd "$CUR_DIR"
