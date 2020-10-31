#!/bin/bash

if ! which -s brew; then
  echo "[DOTFILES] No homebrew found, installing via curl/bash"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew install brew-file
else
  echo "[DOTFILES] Confirmed that homebrew is installed"
fi
