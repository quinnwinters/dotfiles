#!/usr/bin/env bash

# Setup background picture
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "$DOT_DIR/media/wallpaper.jpg"'

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Setup better sleep settings and force ask for password
sudo pmset -a lidwake 1
sudo pmset -a autorestart 1
sudo systemsetup -setrestartfreeze on
sudo pmset -c sleep 0
sudo pmset -b sleep 5
sudo pmset -a standbydelay 86400
sudo systemsetup -setcomputersleep Off >/dev/null
sudo pmset -a hibernatemode 0
sudo rm /private/var/vm/sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage

defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Set screenshots to always save to ~/Pictures/screenshots in PNG format
defaults write com.apple.screencapture location -string "~/Pictures/screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# Always show hidden volumes
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
sudo chflags nohidden /Volumes
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Do not write .DS_Store files to network/drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enforce saner organization defaults
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Setup my clunky expat internationalization standard
defaults write NSGlobalDomain AppleLanguages -array "en" "ar"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
sudo systemsetup -settimezone "America/New_York" >/dev/null

# Setup my dock
defaults write com.apple.dock static-only -bool false
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
find "$HOME/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Setup my trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Remove annoying autocompletes that make code harder to type
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Remove annoying prompts and notifications
sudo nvram SystemAudioVolume=" "
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null
