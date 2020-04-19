#!/bin/bash

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

VIM_RUNTIME_LOC=~/.vim_runtime
if [[ -d VIM_RUNTIME_LOC ]]; then
  echo "Vim runtime directory is already present. Skipping creation"
else
  echo "Creating vim runtime directory"
  mkdir -p "$VIM_RUNTIME_LOC"
fi

# Setup init.vim and .vimrc files required for standard vim reading and then
# link all the proper config files to proper places
cat ./vim/init.vim.template >~/.config/nvim/init.vim
cat ./vim/vimrc.template >~/.vimrc
cat ./vim/install_plugins.template >"$VIM_RUNTIME_LOC"/.vim_plugins
cat ./vim/configure_plugins.template >"$VIM_RUNTIME_LOC"/.vim_plugins_config
cat ./vim/profile.template >"$VIM_RUNTIME_LOC"/.vim_profile
cat ./vim/editorconfig.template >~/.editorconfig

# Install vim plugins
vim +PluginInstall +qall

# Install YouCompleteMe autocomlete
CUR_DIR=$PWD
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
cd "$CUR_DIR"
