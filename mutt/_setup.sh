#!/bin/bash

source ../scripts/printing_utils.sh

muttver=$(mutt --version 2>&1)
if [[ $? != 0 ]] ; then 
    echo "Installing mutt email cli"
    brew install mutt
    warning "Asking for super user access to setup mutt"
    sudo chgrp mail /usr/local/opt/mutt/bin/mutt_dotlock
    sudo chmod g+s /usr/local/opt/mutt/bin/mutt_dotlock
fi 


