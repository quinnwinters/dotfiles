#!/bin/bash 

set -eu

# Setup homebrew, update, and tap the homebrew/bundle
setup_brew() {
  if test ! $(which brew); then 
    echo "Unable to find homebrew install. Installing now"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  
  brew update
  brew tap homebrew/bundle
}

# copy core brew instructions into Brewfile
core_brew() {
  cat .homebrew/core > Brewfile
}

# copy work brew instructions into Brewfile
work_brew() {
  cat .homebrew/core ./homebrew/work > Brewfile
}

# copy personal brew instructions into Brewfile
all_brew() {
  cat .homebrew/core .homebrew/work ./homebrew/personal > Brewfile 
}

# Verify the Brewfile file and then run brew and delete the Brewfile
brew_bundle() {
  brew upgrade
  brew bundle check 
  brew bundle 
  brew cleanup
}

setup() {
  echo "Linking files and importing proper configs"
  echo "Finished setting up all the configs"
}

install() {
  echo "Installing new software based on your asks"
  
  # setting up homebrew properly 
  setup_brew 
  
  # creating a local Brewfile 
  core_brew
  work_brew
  personal_brew
  
  # actually run the brew 
  brew_bundle 

  # Use the setup function to configure things appropriately
  setup
  echo "Finished installing software and running proper setups"
}

if declare -f "$1" > /dev/null
then 
  "$@"
else 
  echo "$1 is not a supported operation. Please use 'install' or 'setup'" >&2
  exit 1
fi 
