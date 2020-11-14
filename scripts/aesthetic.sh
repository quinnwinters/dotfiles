#!/bin/bash

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DOT_DIR/media/wallpaper-1.jpg\""
defaults write com.apple.dock persistent-apps -array

##################################################################################################
# NOTE: You need to add the wait statements before running each command otherwise things are not #
# deterministic and the dock order is not actually guaranteed                                    #
##################################################################################################
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
HELPER_add_external_user_app_to_doc "Agenda"
HELPER_add_external_user_app_to_doc "Things3"
HELPER_add_apple_default_app_to_doc "Safari"
HELPER_add_apple_default_app_to_doc "Mail"
HELPER_add_apple_default_app_to_doc "Calendar"
HELPER_add_external_user_app_to_doc "WhatsApp"
HELPER_add_external_user_app_to_doc "Tweetbot"
HELPER_add_external_user_app_to_doc "Docker"
HELPER_add_external_user_app_to_doc "iTerm"
HELPER_add_external_user_app_to_doc "Visual Studio Code"
HELPER_add_external_user_app_to_doc "zoom.us"
HELPER_add_external_user_app_to_doc "VLC"

killall Dock
