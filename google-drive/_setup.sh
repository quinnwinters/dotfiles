#!/bin/bash

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


while read -r response; do
  case "$response" in
    verified)
      ln -sfn "$GDIR"/Todo "$DDIR"/Todo
      ln -sfn "$GDIR"/Shared "$DDIR"/Shared
      ln -sfn "$GDIR"/Misc "$DDIR"/Misc
      ln -sfn "$GDIR"/Media "$DDIR"/Media
      ln -sfn "$GDIR"/Math "$DDIR"/Math
      ln -sfn "$GDIR"/Grad-Apps "$DDIR"/Grad-Apps
      ln -sfn "$GDIR"/GitHub "$DDIR"/GitHub
      ln -sfn "$GDIR"/Finance "$DDIR"/Finance
      ln -sfn "$GDIR"/Courses "$DDIR"/Courses
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
