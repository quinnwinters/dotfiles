#!/bin/bash

ZSH=~/.oh-my-zsh
if [[ ! -d "$ZSH" ]] ; then
  curl -L http://install.ohmyz.sh | sh
fi

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions

