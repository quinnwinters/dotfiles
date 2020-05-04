#!/bin/bash

source ../scripts/printing_utils.sh

warning "Be careful where you put your ssh info" \
    "Commiting crypto keys can cause identity" \
    "theft"

if [[ ! -d ~/.ssh ]] ; then 
    echo "Creating ~/.ssh directory"
    mkdir ~/.ssh
fi

ln -sf $(pwd)/config ~/.ssh/config

numkeys=$(ls -al ~/.ssh | grep -i ".pub" | wc -l | grep -oE '\d+')
if [[ numkeys=="0" ]] ; then 
    echo "Issuing a new ssh key for github logins"
    ssh-keygen -t rsa -b 4096 -C "$MYEMAIL"
fi

eval "$(ssh-agent -s)"
pbcopy < ~/.ssh/id_rs.pub

echo "=========================================================================="
echo "   MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
echo "=========================================================================="
echo ""
echo ""
echo "To work well with github, add your ssh public key to your profile by"
echo "following the documentation here: https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
echo ""
echo ""
echo ""
echo "When you are done, type the word verified to continue"
echo ""
echo ""

while read -r response; do
  case "$response" in
    verified)
      break
      ;;
    *)
      echo "Please add your public key to github"
      ;;
  esac
done
