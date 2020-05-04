#!/usr/bin/env bash 

defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

rm -rf ~/Library/Application Support/Dock/desktoppicture.db
sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
sudo ln -s $(pwd)/wallpaper.jpg /System/Library/CoreServices/DefaultDesktop.jpg

