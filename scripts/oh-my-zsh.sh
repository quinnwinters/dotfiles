#!/bin/bash

if [[ $(zsh --version 2>&1) != 0 ]]; then
  brew install zsh zsh-completitions
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  curl -L http://install.ohmyz.sh | sh
fi

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
