#!/bin/sh

DOTDIR=$(git rev-parse --show-toplevel)

# Setup the environment
sh "$DOTDIR"/scripts/environment/setup-shell-tools
sh "$DOTDIR"/scripts/environment/setup-local-exports
sh "$DOTDIR"/scripts/environment/setup-github-ssh
sh "$DOTDIR"/scripts/environment/setup-onedrive-docs
sh "$DOTDIR"/scripts/environment/setup-dotfile-links

# Install software
sh "$DOTDIR"/scripts/install/install-brew-apps
sh "$DOTDIR"/scripts/install/install-brew-casks
sh "$DOTDIR"/scripts/install/install-brew-mas
sh "$DOTDIR"/scripts/install/install-ghq-repos
sh "$DOTDIR"/scripts/install/install-vim-plugins

# Tweak preferences
sh "$DOTDIR"/scripts/preferences/setup-macos-prefs
sh "$DOTDIR"/scripts/preferences/setup-mac-dock
