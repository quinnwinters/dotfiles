#!/usr/bin/env bash

which -s conda
if [[ $? != 0 ]]; then
    brew install --cask anaconda
fi

if [[ ! -d $(conda info --base)/envs/neovim ]]; then
    conda environment -n neovim
    pip install neovim
    pip install black
    pip install autopep8
    pip install mypy
    if [[ ! -d "$HOME"/.vim/plugged ]]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
    conda activate base
fi
