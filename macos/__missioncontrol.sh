#!/usr/bin/env bash 

defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
defaults write com.apple.dock mru-spaces -bool false

defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete
