#!/bin/bash

ln -s $(pwd)/drivealiases ~/.aliases/drivealiases

printf "=========================================================================="
printf "   MANUAL ACTION REQUORED-MANUAL ACTION REQUIRED-MANUAL ACTION REQUIRED"
printf "=========================================================================="
printf ""
printf ""
printf "Now the start up script will pause because you need to configure the "
printf "Google Drive file system mount -- use this to back up files"
printf "----------"
printf "Steps: "
printf " 1. Open up google drive file system application"
printf " 2. Log into google drive file system with google credentials"
printf " 3. Verify that the Google Drive file system in '/Volumes"
printf " 4. Type the word verified to continue the setup process"
printf ""
printf ""
printf ""

GDIR=/Volumes/GoogleDrive/My\ Drive
DDIR=/Users/quinnwinters/Documents

function link_gdrive() {
  ln -s $GDIR/$1 $DDIR/$1
}

while read -r response; do
  case "$response" in
    verified)
      link_gdrive Courses
      link_gdrive Finance
      link_gdrive GradApps
      link_gdrive Magic
      link_gdrive Mathematics
      link_gdrive Misc 
      link_gdrive Notability
      link_gdrive Pictures
      link_gdrive Shared
      link_gdrive Video  
      printf ""
      printf "Created links for google drive folders in proper places"
      exit 0
      ;;
    *)
      printf "You have not verified that the drive is mounted properly."
      printf "Please follow steps 1-4"
      ;;
  esac
done
