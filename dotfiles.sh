#!/bin/bash 

set -eu

COMMAND=$1

# Installation flags
INSTALL_CORE=false
INSTALL_WORK=false
INSTALL_PERS=false
INSTALL_ALL=false

# configuration falgs
CONFIGURE_ALL=false
CONFIGURE_ZSH=false
CONFIGURE_TMUX=false
CONFIGURE_GIT=false
CONFIGURE_MAC=false
CONFIGURE_VIM=false
CONFIGURE_ITERM=false
CONFIGURE_FIREFOX=false
CONFIGURE_DRIVE=false\

print_help() {
  if [ "$1"=="install" ]; then 
    echo "Usage for dotfiles install script:"
    echo "------------------------------------"
    echo ""
    echo "\t ./dotfiles.sh install [-c -w -p -a]"
    echo ""
    echo "\t\t -c --core \t\t Install core applications only"
    echo "\t\t -w --work \t\t Install work applications only"
    echo "\t\t -p --personal \t Install personal applications only"
    echo "\t\t -a --all \t\t Install all applications and run configurations"
    echo ""
    echo ""
    exit 0
  elif [ "$1"=="configure" ]; then
    echo "Usage for dotfiles configure script:"
    echo "------------------------------------"
    echo ""
    echo "\t ./dotfiles.sh configure [-z -t -g -m -v -i -f -d -a]"
    echo ""
    echo "\t\t -z --zsh \t\t\t Configure zsh and oh-my-zsh"
    echo "\t\t -t --tmux \t\t\t Configure tmux"
    echo "\t\t -g --git \t\t\t Configure gitignore and gitconfig"
    echo "\t\t -m --mac \t\t\t Configure macos core settings"
    echo "\t\t -v --vim \t\t\t Configure vim and various vim plugins"
    echo "\t\t -i --iterm \t\t\t Configure iTerm2 themes and settings"
    echo "\t\t -f --firefox \t\t Configure Firefox bookmarks and plugins"
    echo "\t\t -d --google-drive\t Configure Google Drive file mount"
    echo "\t\t -a --all \t\t Configure all settings"
    exit 0
  else 
    echo "Please use ./dotfiles.sh install --help or ./dotfiles.sh configure --help for usage"
    echo 0
  fi
}

while test $
do
    case "$1" in 
    -c|--core)
      INSTALL_CORE=true
      ;;
    -w|--work)
      INSTALL_WORK=true
      ;;
    -p|--personal)
      INSTALL_PERSONAL=true
    -a|--all)
      INSTALL_ALL=true
      CONFIGURE_ALL=true
      ;;
    -z|--zsh)
      CONFIGURE_ZSH=true
      ;;
    -t|--tmux)
      CONFIGURE_TMUX=true
      ;;
    -g|--git)
      CONFIGURE_GIT=true
      ;;
    -m|--mac)
      CONFIGURE_MAC=true
      ;;
    -v|--vim)
      CONFIGURE_VIM=true
      ;;
    -i|--iterm)
      CONFIGURE_ITERM=true
      ;;
    -f|--firefox)
      CONFIGURE_FIREFOX=true
      ;;
    -d|--google-drive)
      CONFIGURE_DRIVE=true
      ;;
    -h|--help)
      print_help COMMAND
    *)
      break
      ;;
  esac
done


# Setup homebrew, update, and tap the homebrew/bundle
setup_brew() {
  if test ! $(which brew); then 
    echo "Unable to find homebrew install. Installing now"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  
  brew update
  brew tap homebrew/bundle

  touch Brewfile
}

# copy core brew instructions into Brewfile
core_brew() {
  cat Brewfile .homebrew/core > Brewfile
}

# copy work brew instructions into Brewfile
work_brew() {
  cat Brewfile .homebrew/work > Brewfile
}

personal_brew() {
  cat Brewfile .homebrew/personal > Brewfile
}

# copy personal brew instructions into Brewfile
all_brew() {
  cat .homebrew/core .homebrew/work .homebrew/personal > Brewfile 
}

# Verify the Brewfile file and then run brew and delete the Brewfile
brew_bundle() {
  brew upgrade
  brew bundle check 
  brew bundle 
  brew cleanup
  rm -f Brewfile
}

configure() {
  echo "Linking files and importing proper configs"
  echo "Finished setting up all the configs"
}

install() {
  echo "Installing new software based on your asks"
  
  # setting up homebrew properly 
  setup_brew 
  # creating a local Brewfile 
  if $CONFIGURE_ALL ; then 
    all_brew
  else 
    if $CONFIGURE_CORE ; then 
      core_brew
    elif $CONFIGURE_WORK ; then 
      work_brew
    elif $PERSONAL_BREW ; 
      personal_brew
    fi
  fi 
  
  # actually run the brew 
  brew_bundle 

  # Use the setup function to configure things appropriately
  if $CONFIGURE_ALL ; then 
    configure
  fi 
  echo "Finished installing software and running proper setups"
}

if declare -f "$1" > /dev/null
then 
  "$1"
else 
  echo "$1 is not a supported operation. Please use 'install' or 'setup'" >&2
  exit 1
fi 
