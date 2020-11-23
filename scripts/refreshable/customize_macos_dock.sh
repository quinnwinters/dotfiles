#!/bin/bash

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DOT_DIR/media/wallpaper-1.jpg\""
defaults write com.apple.dock persistent-apps -array

function HELPER_add_apple_default_app_to_doc() {
  wait
  defaults write com.apple.dock persistent-apps -array-add "
        <dict>
            <key>tile-data</key>
            <dict>
                <key>file-data</key>
                <dict>
                    <key>_CFURLString</key>
                    <string>/System/Applications/$1.app</string>
                    <key>_CFURLStringType</key>
                    <integer>0</integer>
                </dict>
            </dict>
        </dict>"
}

function HELPER_add_external_user_app_to_doc() {
  wait
  defaults write com.apple.dock persistent-apps -array-add "
        <dict>
            <key>tile-data</key>
            <dict>
                <key>file-data</key>
                <dict>
                    <key>_CFURLString</key>
                    <string>/Applications/$1.app</string>
                    <key>_CFURLStringType</key>
                    <integer>0</integer>
                </dict>
            </dict>
        </dict>"
}

function HELPER_add_blankspaces_to_doc() {
  wait
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
}

HELPER_add_blankspaces_to_doc

# Apple default utilities
HELPER_add_apple_default_app_to_doc "System Preferences"
HELPER_add_apple_default_app_to_doc "App Store"
HELPER_add_external_user_app_to_doc "1Password 7"
HELPER_add_apple_default_app_to_doc "Preview"
HELPER_add_external_user_app_to_doc "Microsoft OneNote"
HELPER_add_external_user_app_to_doc "Things3"
HELPER_add_apple_default_app_to_doc "Safari"
HELPER_add_external_user_app_to_doc "Microsoft Outlook"
HELPER_add_apple_default_app_to_doc "WhatsApp"
HELPER_add_external_user_app_to_doc "Zoom"
HELPER_add_external_user_app_to_doc "VLC"
HELPER_add_apple_default_app_to_doc "Terminal"
HELPER_add_external_user_app_to_doc "Docker"

killall Dock
