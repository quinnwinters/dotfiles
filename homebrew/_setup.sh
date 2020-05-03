#!/bin/bash

if [[ "$(which -s brew)" != 0 ]] ; then 
    echo "Installing homebrew package manager"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    brew update
fi

brew install rcmdnk/file/brew-file

ln -s $(pwd)/Brewfile ~/.brewfile
cat ~/.bashrc $(pwd)/bash_additions > ~/.bashrc

export HOMEBREW_BREWFILE=~/.brewfile
brew file install
