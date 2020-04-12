#!/bin/bash

CFG=~/.config/nvim/
if [[ -d $CFG ]] ; then
    echo "Neovim initialization directory is already present. Skipping setup"
else
    echo "Setting up neovim configuration"
    mkdir -p  $CFG
    cat ./vim/init.vim.template > $CFG/init.vim
fi

VNDL=~/.vim/bundle/Vundle.vim
if [[ -d $VNDL ]] ; then
  echo "Vundle is already installed. Skipping installation"
else
  echo "Installing Vundle Package Manager"
  git clone https://github.com/VundleVim/Vundle.vim.git $VNDL
fi

VIM_RUNTIME_LOC=~/.vim_runtime
if [[ -d VIM_RUNTIME_LOC ]] ; then
  echo "Vim runtime directory is already present. Skipping creation"
else
  echo "Creating vim runtime directory"
  mkdir -p $VIM_RUNTIME_LOC
fi

# Setup init.vim and .vimrc files required for standard vim reading and then
# link all the proper config files to proper places
cat ./vim/init.vim.template > ~/.config/nvim/init.vim
cat ./vim/vimrc.template > ~/.vimrc
ln -s $(pwd)/vim/.vim_plugins $VIM_RUNTIME_LOC/.vim_plugins
ln -s $(pwd)/vim/.vim_plugins_config $VIM_RUNTIME_LOC/.vim_plugins_config
ln -s $(pwd)/vim/.vim_profile $VIM_RUNTIME_LOC/.vim_profile
ln -s $(pwd)/vim/.editorconfig ~/.editorconfig

# Install vim plugins
vim +PluginInstall +qall


# Install YouCompleteMe autocomlete
CUR_DIR=$(pwd)
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
cd $CUR_DIR
