#!/bin/bash

GDIR=$HOME/Google\ Drive
DDIR=$HOME/Documents

function link_gdrive() {
  ln -sf "$GDIR/$1" "$DDIR/$1"
}

echo "=========================================================================="
echo "   MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
echo "=========================================================================="
echo ""
echo ""
echo "Now the start up script will pause because you need to configure the "
echo "Google Drive file system mount -- use this to back up files"
echo "----------"
echo "Steps: "
echo " 1. Open up google drive file system application"
echo " 2. Log into google drive file system with google credentials"
echo " 3. Verify that the Google Drive file system in '/Volumes"
echo " 4. Type the word verified to continue the setup process"
echo ""
echo ""
echo "(download link: https://www.google.com/drive/download/)"
echo ""
echo ""
while read -r response; do
  case "$response" in
    verified)
      find "$GDIR" -type d -maxdepth 1 | link_gdrive
      echo ""
      echo "Created links for google drive folders in proper places"
      break
      ;;
    *)
      echo "You have not verified that the drive is mounted properly."
      echo "Please follow steps 1-4"
      ;;
  esac
done
