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
  echo "Creating alias directory at ~/.aliases"
  mkdir -vp ~/.aliases
fi

ln -s $(pwd)/zaliases ~/.zaliases
ln -s $(pwd)/zcompletions ~/.zcompletions
ln -s $(pwd)/zshenv ~/.zshenv
ln -s $(pwd)/zshrc ~/.zshrc
