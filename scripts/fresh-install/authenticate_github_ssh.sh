#!/bin/bash

echo "[DOTFILES] =========================================================================="
echo "[DOTFILES]    MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
echo "[DOTFILES] =========================================================================="
echo "[DOTFILES] "
echo "[DOTFILES] "
echo "[DOTFILES] Now the start up script will pause because you need to configure ssh-trust"
echo "[DOTFILES] with github.com both for install purposes and for general git hygene."
echo "[DOTFILES] ----------"
echo "[DOTFILES] Steps: "
echo "[DOTFILES]  1. Enter the email you use for github"
echo "[DOTFILES]  2. Give the keyfile a name"
echo "[DOTFILES]  3. Give your ssh key a password if you want"
echo "[DOTFILES]  4. Add your key to your github account"
echo "[DOTFILES]  5. Type 'verified' to continue with dotfile setup"
echo "[DOTFILES] "
echo "[DOTFILES] "
echo "[DOTFILES] "

echo "[DOTFILES] Enter your email (the one you use with github)"
read -r email
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh -agent -s)"
echo "[DOTFILES] Enter the path to your key to add to the ssh-agent"
read -r sshkey
ssh-add -K "$sshkey"
pbcopy <"$sshkey"
echo "[DOTFILES] Go to github.com and paste your key into your ssh key list in settings"
echo "[DOTFILES] When that is done, type verified below"

while read -r response; do
  case "$response" in
    verified)
      echo "[DOTFILES] "
      echo "[DOTFILES] Trust with github should be established!"
      break
      ;;
    *)
      echo "[DOTFILES] You have not verified that the git-ssh is setup!!"
      echo "[DOTFILES] Please follow steps 1-5 in order to continue"
      ;;
  esac
done
