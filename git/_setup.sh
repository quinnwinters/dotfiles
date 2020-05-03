#!/bin/bash

ln -s ./gitconfig ~/.gitconfig
ln -s ./gitignore ~/.gitignore

REPODIR=~/Documents/GitHub
if [[ ! -d $REPODIR ]] ; then 
    echo "Making directory for all git projects: $REPODIR"
    mkdir -vp $REPODIR
fi

myrepos=(
    quinnwinters.github.io
    mathematics-gre
    mathematics-notes
    spark-quadrature
    quinnwinters-latex-cv
    quinnwinters-todo
)

for repo in myrepos ; do 
    git clone git@github.com:quinnwinters/$repo $REPODIR/$repo
done

if [[ ! -d ~/.aliases ]] ; then 
  echo "Creating alias directory at ~/.aliases"
  mkdir -vp ~/.aliases
fi

ln -s gitaliases ~/.aliases/gitaliases