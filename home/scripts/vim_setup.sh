#!/usr/bin/env bash
if [[ ! -f "/opt/anaconda3/bin/conda" ]]; then
  brew install --cask anaconda
fi

if [[ ! -d "/opt/anaconda3/envs/neovim" ]]; then
  /opt/anaconda3/bin/conda environment -n neovim
fi

/opt/anaconda3/bin/conda activate neovim

pip install neovim
pip install black
pip install autopep8
pip install mypy

if [[ ! -d "$HOME"/.vim/plugged ]]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

conda activate base
