#!/bin/bash
VUNDLE_LOC=~/.vim/bundle/Vundle.vim
if [[ -d $VUNDLE_LOC ]] ; then
  echo "Vundle is already installed. Skipping installation"
else
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_LOC
fi

VIM_RUNTIME_LOC=~/.vim_runtime
if [[ -d VIM_RUNTIME_LOC ]] ; then
  echo "Vim runtime directory is already present. Skipping creation"
else
  echo "Creating vim runtime directory"
  mkdir -p $VIM_RUNTIME_LOC
fi

cat ./vim/vimrc.template > ~/.vimrc
ln -sfn ./vim/.vim_plugins > $VIM_RUNTIME_LOC/.vim_plugins
ln -sfn ./vim/.vim_plugins_config > $VIM_RUNTIME_LOC/.vim_plugins_config
ln -sfn ./vim/.vim_profile > $VIM_RUNTIME_LOC/.vim_profile
ln -sfn ./vim/.editorconfig > ~/.editorconfig

source ~/.vimrc
vim +PluginInstall +qall

