#!/bin/sh 

if [[ ! -d $HOME/.venv ]] ; then 
    mkdir -p $HOME/.venv
fi 

for f in $HOME/.venv_defs/* ; do 
    environment=$(basename $f)
    if [[ ! -d $HOME/.venv/$environment ]] ; then 
        echo "Creating virtual environment $environment"
        virtualenv $HOME/.venv/$environment
    fi  
    echo "Installing requirements for $environment"
    $HOME/.venv/$environment/bin/pip install -r $HOME/.venv_defs/$environment
done