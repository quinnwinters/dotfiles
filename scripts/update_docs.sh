#!/bin/bash

if [[ -z $DOT_DIR ]] ; then 
    cd $DOT_DIR

    rm docs/README.md
    touch docs/README.md
    cat ./docs/README.md $DOT_DIR/homebrew/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/git/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/vim/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/python/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/latex/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/todo/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/ssh/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/macos/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/mutt/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/google-drive/_desc.md > ./docs/README.md
    cat ./docs/README.md $DOT_DIR/zsh/_desc.md > ./docs/README.md

fi
