#!/usr/bin/env bash

if [[ ! ${xcode-select --version} ]]; then
  echo "No xcode-select tools found. Running 'sudo xcode-select install' to get xcode-select tools"
  sudo xcode-select --install
fi

which -s brew
if [[ $? != 0 ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >>"$HOME"/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

which -s boxes
if [[ $? != 0 ]]; then
  brew install boxes
fi

function header() {
  echo "$@" | boxes -d simple -p a1l2r2
}

header """ Linking dotfiles
----
By default this script will replace all existing dotfiles with symlinks to the dotfiles contained
in this repo. It will backup the existing dotfiles in place by moving them from {thing} to {thing}.bkup
"""

for homeobj in home/*; do
  should_link=true
  dotobj=".$(basename "$homeobj")"
  if [[ -f "$HOME"/"$dotobj" ]] || [[ -d "$HOME"/"$dotobj" ]]; then
    while true; do
      read -p "There is already a file at ~/$dotobj Do you want to override it (existing content will be backed up) [y/n]? " -n 1 -r
      echo ""
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv "$HOME"/"$dotobj" "$HOME"/"$dotobj.bkup"
        ln -sfn "$PWD"/"$homeobj" "$HOME"/"$dotobj"
        break
      elif [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "Skipping ~/$dotobj"
        break
      else
        echo "Unable to read response. Please try again"
      fi
    done
  else
    ln -sfn "$PWD"/"$homeobj" "$HOME"/"$dotobj"
  fi
done

header """MANUAL ACTION: GITHUB SSH AUTHENTICATION
----
By default these dotfiles use github over ssh for all operation (for both
security and convenience purposes). You should only have to setup authentication
for github once per computer.
"""

while true; do
  read -p "Do you want to continue with setting up github ssh authentication [y/n]? " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    sleep 1
    read -p "Enter your github email: " email
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh -agent -s)"
    read -p "Enter the location of where you stored your ssh key: " sshkey
    ssh-add -K "$sshkey"
    pbcopy <"$sshkey.pub"
    echo "Go to https://github.com/settings/keys and add your key"
    sleep 20
    break
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Skipping github ssh setup"
    break
  else
    echo "Unable to read response. Please try again"
  fi
done

header """ Installing homebrew formula
----
This script will install all the formula specified in your brew file found under ~/.config/brewfile/Brewfile.
If you don't want any of the formula, or you just want to skip this step, you can do so now, but note that
this might cause errors with other parts of the installation
"""

while true; do
  read -p "Do you want to install all formula in ~/.config/brewfile/Brewfile at this time [y/n]? " -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install rcmdnk/file/brew-file
    brew file install -f "$HOME"/.config/brewfile/Brewfile
    break
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Skipping brewfile install"
    break
  else
    echo "Unable to read response. Please try again"
  fi
done

if [[ -d /Applications/OneDrive.app ]]; then
  header """Microsoft OneDrive Sync
About to setup authentication with Microsoft OneDrive and link folders up. If you
have already set this up you should skip this step
    """

  while true; do
    read -p "Would you like to setup OneDrive sync [y/n]? " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Opening the applications folder in finder. You have to authenticate with OneDrive Manually"
      open /Applications
      sleep 15
      echo "When that is done, type verified below"
      while read -r response; do
        echo ""
        case "$response" in
          verified)
            echo "Authentication with OneDrive Established!"
            break
            ;;
          *)
            echo "You have not verified that the OneDrive is setup!!"
            echo "Please follow the instructions to continue"
            ;;
        esac
      done
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      echo "Skipping OneDrive setup"
      break
    else
      echo "Unable ot read response. Please try again"
    fi
  done
fi
