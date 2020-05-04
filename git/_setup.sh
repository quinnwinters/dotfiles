#!/bin/bash

ln -sf ./gitconfig ~/.gitconfig
ln -sf ./gitignore ~/.gitignore

REPODIR=~/Documents/GitHub
if [[ ! -d $REPODIR ]] ; then
    echo "Making directory for all git projects: $REPODIR"
    mkdir -vp $REPODIR
fi

PWD=$(pwd)
cd $REPODIR
curl -k "https://api.github.com/users/quinnwinters/repos?page=1&per_page=100" | \
    grep -e 'git_url*' | \
    grep -vwE 'dotfiles' | \
    cut -d \" -f 4 | \
    xargs -L1 git clone
cd $PWD

if [[ ! -d ~/.aliases ]] ; then
  echo "Creating alias directory at ~/.aliases"
  mkdir -vp ~/.aliases
fi

ln -sf $(pwd)/gitaliases ~/.aliases/gitaliases
