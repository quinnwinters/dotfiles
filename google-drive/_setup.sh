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
echo ""

while read response; do
  case "$response" in
    verified)
      ln -sfn /Volumes/GoogleDrive/My\ Drive/Documents ~/Documents/Documents
      ln -sfn /Volumes/GoogleDrive/My\ Drive/GitHub ~/Documents/GitHub
      ln -sfn /Volumes/GoogleDrive/My\ Drive/Media ~/Documents/Media
      ln -sfn /Volumes/GoogleDrive/My\ Drive/Misc ~/Documents/Misc
      echo ""
      echo "Created links for google drive folders in proper places"
      exit 0
      ;;
    *)
      echo "You have not verified that the drive is mounted properly."
      echo "Please follow steps 1-4"
      ;;
  esac
done
