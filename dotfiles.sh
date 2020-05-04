#!/bin/bash

export DOT_DIR="$(pwd)"
echo 'export DOT_DIR="$(pwd)"' >> ~/.bashrc
source $DOT_DIR/scripts/printing_utils.sh

dotfiles

function run_submodule() {
  DIR="$1"
  PWD=$(pwd)
  task "Runing setup instructions for dotfiles/$DIR"
  echo "About to change directory to run $DIR/_setup.sh"
  cd $DIR
  sudo chmod +x ./_setup.sh
  ./_setup.sh
  cd $DOT_DIR
  echo "Finished setting up $DIR"
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

