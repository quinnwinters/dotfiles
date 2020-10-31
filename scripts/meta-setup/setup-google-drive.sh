#!/bin/bash

GDIR=$HOME/Google\ Drive
DDIR=$HOME/Documents

function link_gdrive() {
  ln -sf "$GDIR/$1" "$DDIR/$1"
}

echo "[DOTFILES] =========================================================================="
echo "[DOTFILES]    MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
echo "[DOTFILES] =========================================================================="
echo "[DOTFILES] "
echo "[DOTFILES] "
echo "[DOTFILES] Now the start up script will pause because you need to configure the "
echo "[DOTFILES] Google Drive file system mount -- use this to back up files"
echo "[DOTFILES] ----------"
echo "[DOTFILES] Steps: "
echo "[DOTFILES]  1. Open up google drive file system application"
echo "[DOTFILES]  2. Log into google drive file system with google credentials"
echo "[DOTFILES]  3. Verify that the Google Drive file system in '/Volumes"
echo "[DOTFILES]  4. Type the word verified to continue the setup process"
echo "[DOTFILES] "
echo "[DOTFILES] "
echo "[DOTFILES] (download link: https://www.google.com/drive/download/)"
echo "[DOTFILES] "
echo "[DOTFILES] "
while read -r response; do
  case "$response" in
    verified)
      find "$GDIR" -type d -maxdepth 1 | link_gdrive
      echo "[DOTFILES] "
      echo "[DOTFILES] Created links for google drive folders in proper places"
      break
      ;;
    *)
      echo "[DOTFILES] You have not verified that the drive is mounted properly."
      echo "[DOTFILES] Please follow steps 1-4"
      ;;
  esac
done
