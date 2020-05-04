#!/bin/bash

export DOT_DIR="$(pwd)"
source $DOT_DIR/scripts/printing_utils.sh

dotfiles

function run_submodule() {
  DIR="$1"
  cat docs/README.md $DIR/_desc.md > docs/README.md
  PWD=$(pwd)
  task "Runing setup instructions for dotfiles/$DIR"
  cd $DIR
  chmod +x _setup.sh
  ./_setup.sh
  cd $PWD
}

if [[ $EUID -ne 0 ]]; then
  warning "In order to get the most complete install, this script" \
    "needs sudo access. Please read through the various" \
    "scripts to make sure you are comfortable with that"
  exit 1
else 
  warning "Running install script with super user access"
fi

run_submodule homebrew
run_submodule zsh
run_submodule vim 
run_submodule latex
run_submodule git
run_submodule python
run_submodule jvm
run_submodule todo
run_submodule google-drive

