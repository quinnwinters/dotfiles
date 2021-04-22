#!/bin/sh

if [[ ! -f "$HOME"/.mackup.cfg ]]; then
    DOT_DIR=$(git rev-parse --show-toplevel)
    ln -sfn "$DOT_DIR"/home/mackup.cfg "$HOME"/.mackup.cfg
fi

mackup restore
