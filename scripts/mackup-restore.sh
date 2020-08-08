#!/bin/bash

if [[ ! -L "~/.mackup.cfg" ]]; then
    rm -f ~/.mackup.cfg
    ln -sf "$DOT_DIR"/home/.mackup.cfg ~/.mackup.cfg
fi

mackup restore
