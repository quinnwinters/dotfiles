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

header """MANUAL ACTION: GITHUB SSH AUTHENTICATION
----
By default these dotfiles use github over ssh for all operation (for both
security and convenience purposes). You should only have to setup authentication
for github once per computer.
"""

echo "Do you want to continue with setting up github ssh authentication? [Y/n]"
select yn in "Yes" "No"; do
  if [[ $yn == "Yes" ]]; then
    echo "Enter your github email below:"
    read -r email
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh -agent -s)"
    echo "Enter the location of where you stored your key to add it to your ssh agent"
    read -r sshkey
    ssh-add -K "$sshkey"
    pbcopy <"$sshkey"
    echo "Go to https://github.com/settings/keys and paste your key into your ssh key list in settings"
    sleep 10
    break
  else
    echo "Skipping setting up github ssh"
    break
  fi
done

header """ Linking dotfiles 
----
By default this script will replace all existing dotfiles with symlinks to the dotfiles contained
in this repo. It will backup the existing dotfiles in place by moving them from {thing} to {thing}.bkup
"""

for homeobj in home/*; do
  should_link=true
  dotobj=".$(basename $homeobj)"
  if [[ -f "$HOME"/"$dotobj" ]] || [[ -d "$HOME"/"$dotobj" ]]; then
    echo "~/$dotobj already exists in home folder. Should we override it?"
    select yn in "Yes" "No"; do
      if [[ $yn == "Yes" ]]; then
        mv "$HOME"/"$dotobj" "$HOME"/"$dotobj.bkup"
        break
      else
        should_link=false
        break
      fi
    done
  fi
  if $should_link; then
    ln -sfn "$(pwd)/$homeobj" "$HOME"/"$dotobj"
  fi
done

header """ Installing homebrew formula
----
This script will install all the formula specified in your brew file found under ~/.config/brewfile/Brewfile. 
If you don't want any of the formula, or you just want to skip this step, you can do so now, but note that 
this might cause errors with other parts of the installation
"""

echo "Do you want to install the formula from your brewfile? [Y/n]"
select yn in "Yes" "No"; do
  if [[ $yn == "Yes" ]]; then
    brew file install
    break
  else
    echo "Skipping installation"
    break
  fi
done

if [[ -d /Applications/OneDrive.app ]]; then
  header """Microsoft OneDrive Sync
About to setup authentication with Microsoft OneDrive and link folders up. If you
have already set this up you should skip this step
    """

  echo "Would you like to setup OneDrive sync?"
  select yn in "Yes" "No"; do
    if [[ $yn == "Yes" ]]; then
      echo "Opening the applications folder in finder. You have to authenticate with OneDrive Manually"
      open /Applications
      sleep 15
      echo "When that is done, type verified below"
      while read -r response; do
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
    else
      echo "Skipping OneDrive setup"
      break
    fi
    break
  done
fi
