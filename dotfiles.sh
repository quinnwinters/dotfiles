#!/bin/bash

export DOT_DIR="$(pwd)"
echo 'export DOT_DIR=$(pwd)' >> ~/.bashrc
source $DOT_DIR/scripts/printing_utils.sh

dotfiles

function run_submodule() {
  DIR="$1"
  cat ./docs/README.md $DIR/_desc.md > ./docs/README.md
  PWD=$(pwd)
  task "Runing setup instructions for dotfiles/$DIR"
  cd ./$DIR
  sudo chmod +x _setup.sh
  ./_setup.sh
  cd $PWD
}

run_submodule homebrew
run_submodule zsh
run_submodule ssh
run_submodule vim 
run_submodule latex
run_submodule git
run_submodule python
run_submodule jvm
run_submodule todo
run_submodule google-drive
run_submodule macos
run_submodule mutt
run_submodule tmux
run_submodule cron

