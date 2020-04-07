#!/bin/bash

ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  echo "oh-my-zsh is already installed, skipping installation"
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
fi

ln -s .zsh_aliases ~/.aliases
ln -s .zshrc ~/.zshrc
ln -s .zsh_completion ~/z.sh
