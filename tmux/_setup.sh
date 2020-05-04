#!/bin/bash

tmuxver=$(tmux -V 2>&1)
if [[ $? != -]] ; then 
    echo "Installing tmux"
    brew install tmux 
fi

ln -sf $(pwd)/tmux.cfg ~/.tmux.cfg
ln -sf $(pwd)/tmuxaliases ~/.aliases/tmuxaliases
