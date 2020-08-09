#!/bin/bash

if [[ $(zsh --version 2>&1) != 0 ]]; then
    brew install zsh zsh-completitions
fi


if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  curl -L http://install.ohmyz.sh | sh
fi

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions
