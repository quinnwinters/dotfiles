#!/bin/bash

ZSH=~/.oh-my-zsh
if [ -d "$ZSH" ]; then
  echo "oh-my-zsh is already installed, skipping installation"
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
fi

cat ./zsh/aliases.template >~/.aliases
cat ./zsh/zshrc.template >~/.zshrc
