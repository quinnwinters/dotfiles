#!/bin/bash

texversion=$(latex --version 2>&1)
if [[ $? != 0 ]] ; then
    echo "Installing latex"
    brew cask install mactex texstudio
fi

TEXTEMPLATES=~/.latex_templates
if [[ ! -d $TEXTEMPLATES ]] ; then 
    echo "Making LaTeX templates collection: $TEXTEMPLATES"
    mkdir -vp $TEXTEMPLATES
fi

ln -sf $(pwd)/mathematics-header.tex ~/.latex_templates/mathematics-header.tex
ln -sf $(pwd)/texaliases ~/.aliases/texaliases

