#!/bin/bash

echo "=========================================================================="
echo "   MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
echo "=========================================================================="
echo ""
echo ""
echo "Now the start up script will pause because you need to configure ssh-trust"
echo "with github.com both for install purposes and for general git hygene."
echo "----------"
echo "Steps: "
echo " 1. Enter the email you use for github"
echo " 2. Give the keyfile a name"
echo " 3. Give your ssh key a password if you want"
echo " 4. Add your key to your github account"
echo " 5. Type 'verified' to continue with dotfile setup"
echo ""
echo ""
echo ""

echo "Enter your email (the one you use with github)"
read -r email 
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh -agent -s)"
echo "Enter the path to your key to add to the ssh-agent"
read -r sshkey
ssh-add -K $sshkey
pbcopy < $sshkey
echo "Go to github.com and paste your key into your ssh key list in settings"
echo "When that is done, type verified below"

while read -r response; do
  case "$response" in
    verified)
      echo ""
      echo "Trust with github should be established!"
      break
      ;;
    *)
      echo "You have not verified that the git-ssh is setup!!"
      echo "Please follow steps 1-5 in order to continue"
      ;;
  esac
done

