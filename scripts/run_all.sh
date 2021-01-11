#!/bin/sh

DOTDIR=$(git rev-parse --show-toplevel)

# Setup the environment
sh "$DOTDIR"/environment/setup-shell-tools
sh "$DOTDIR"/environment/setup-local-exports
sh "$DOTDIR"/environment/setup-github-ssh
sh "$DOTDIR"/environment/setup-onedrive-docs
sh "$DOTDIR"/environment/setup-dotfile-links

# Install software
sh "$DOTDIR"/install/install-brew-apps
sh "$DOTDIR"/install/install-brew-casks
sh "$DOTDIR"/install/install-brew-mas
sh "$DOTDIR"/install/install-ghq-repos
sh "$DOTDIR"/install/install-vim-plugins

# Tweak preferences
sh "$DOTDIR"/preferences/setup-macos-prefs
sh "$DOTDIR"/preferences/setup-mac-dock
