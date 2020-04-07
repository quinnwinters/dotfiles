#!/bin/bash

ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  echo "oh-my-zsh is already installed, skipping installation"
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
fi

echo "Linking up proper aliases and zshrc files"
ln -sfn .zsh_aliases ~/.aliases
ln -sfn .zshrc ~/.zshrc
echo "Finished configuring oh-my-zsh. Remember to change shell when the configuration is finished running"

