#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" exit
done 2>/dev/null &

#############################################################
#       UI/UX Settings                                      #
#############################################################
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write com.apple.dock autohide-delay -float 0

#############################################################
#       Coding Setting Modifications                        #
#############################################################
defaults write com.apple.helpviewer DevMode -bool true
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#############################################################
#       Interantionalization Settings                       #
#############################################################
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  H:mm:ss'
defaults write NSGlobalDomain AppleLanguages -array "en" "ar"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency#USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

#############################################################
#       Sleep and Screen Lock Settings                      #
#############################################################
sudo pmset -a lidwake 1
sudo pmset -a autorestart 1
sudo systemsetup -setrestartfreeze on
sudo pmset -c sleep 0
sudo pmset -b sleep 5
sudo pmset -a standbydelay 86400
sudo systemsetup -setcomputersleep Off >/dev/null
sudo pmset -a hibernatemode 0
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#############################################################
#      Screenshot settings                                  #
#############################################################
mkdir -p "$HOME"/Pictures/screenshots
defaults write com.apple.screencapture location -string "~/Pictures/screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

killall Dock
