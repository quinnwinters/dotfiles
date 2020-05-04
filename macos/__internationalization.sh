#!/usr/bin/env bash

defaults write NSGlobalDomain AppleLanguages -array "en" "ar"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
sudo systemsetup -settimezone "America/New_York" > /dev/null
