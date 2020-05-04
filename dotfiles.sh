#!/bin/bash

export DOT_DIR="$(pwd)"
source $DOT_DIR/scripts/printing_utils.sh

dotfiles

function run_submodule() {
  DIR="$1"
  cat ./docs/README.md $DIR/_desc.md > ./docs/README.md
  PWD=$(pwd)
  task "Runing setup instructions for dotfiles/$DIR"
  cd ./$DIR
  chmod +x _setup.sh
  ./_setup.sh
  cd $PWD
}

run_submodule homebrew
run_submodule zsh
run_submodule vim 
run_submodule latex
run_submodule git
run_submodule python
run_submodule jvm
run_submodule todo
run_submodule google-drive

