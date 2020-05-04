#!/bin/bash
zshver=$(zsh --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Installing zsh"
    brew install zsh zsh-completions
fi

nvimver=$(nvim --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Installing (neo)vim"
    brew install vim python3
    brew install neovim
fi 

ZSH=~/.oh-my-zsh
if [[ ! -d "$ZSH" ]] ; then
  echo "Installing oh-my-zsh"
  curl -L http://install.ohmyz.sh | sh
fi

if [[ ! -d ~/.aliases ]] ; then 
  echo "Creating aliases directory"
  mkdir -vp ~/.aliases
fi 

ln -sf $(pwd)/zaliases ~/.zaliases
ln -sf $(pwd)/zcompletions ~/.zcompletions
ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/zshrc ~/.zshrc
