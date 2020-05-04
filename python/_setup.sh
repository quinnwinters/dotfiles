#!/bin/bash

pythonver=$(python --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Installing python"
    brew install python
fi

python3ver=$(python --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Instally python version 3"
    brew install python3
fi

virtualenvver=$(virtualenv --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Instally virtualenv"
    brew install virtualenv
fi

pyenv=$(pyenv --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Instally pyenv"
    brew install pyenv
fi

jupytervver=$(jupyter --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Instally jupyter"
    brew install jupyter
fi

condaver=$(conda --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Installing conda"
    brew cask install conda
    export PATH="/usr/local/anaconda3/bin:$PATH"
fi

ln -s $(pwd)/pyaliases ~/.aliases/pyaliases

while read version ; do 
    echo "Installing (or reloading) Python version: $version"
    pyenv install $version 
done<"versions"
pyenv global 3.8.2

while read pkg ; do 
    echo "Installing package: $pkg" 
    pip3 install $pkg
done<"packages"




