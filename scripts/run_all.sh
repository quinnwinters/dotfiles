#!/bin/sh

# Setup the environment
sh ./environment/setup-shell-tools
sh ./environment/setup-local-exports
sh ./environment/setup-github-ssh
sh ./environment/setup-onedrive-docs
sh ./environment/setup-dotfile-links

# Install software
sh ./install/install-brew-apps
sh ./install/install-brew-casks
sh ./install/install-brew-mas
sh ./install/install-ghq-repos
sh ./install/install-vim-plugins

# Tweak preferences
sh ./preferences/setup-macos-prefs
sh ./preferences/setup-mac-dock

