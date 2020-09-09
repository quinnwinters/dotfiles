#!/bin/bash

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
HELPER_add_apple_default_app_to_doc "Dictionary"
HELPER_add_apple_default_app_to_doc "Photo Booth"
HELPER_add_blankspaces_to_doc

# Some basic Utilities
HELPER_add_external_user_app_to_doc "1Password 7"
HELPER_add_external_user_app_to_doc "LaunchD Task Scheduler"
HELPER_add_external_user_app_to_doc "Freedom"
HELPER_add_external_user_app_to_doc "iStat Menus"
HELPER_add_blankspaces_to_doc

# Regular applications
HELPER_add_apple_default_app_to_doc "Contacts"
HELPER_add_apple_default_app_to_doc "Calendar"
HELPER_add_apple_default_app_to_doc "Mail"
HELPER_add_external_user_app_to_doc "Google Chrome"
HELPER_add_external_user_app_to_doc "WhatsApp"
HELPER_add_external_user_app_to_doc "Messenger"
HELPER_add_external_user_app_to_doc "Notion"
HELPER_add_external_user_app_to_doc "Things3"
HELPER_add_external_user_app_to_doc "Slack"
HELPER_add_blankspaces_to_doc

# Coding applications
HELPER_add_external_user_app_to_doc "Gitter"
HELPER_add_external_user_app_to_doc "GitKraken"
HELPER_add_external_user_app_to_doc "texstudio"
HELPER_add_external_user_app_to_doc "Hyper"
HELPER_add_external_user_app_to_doc "Docker"
HELPER_add_external_user_app_to_doc "IntelliJ IDEA CE"
HELPER_add_external_user_app_to_doc "PyCharm CE"
HELPER_add_blankspaces_to_doc

# Video and Chat
HELPER_add_external_user_app_to_doc "zoom.us"
HELPER_add_external_user_app_to_doc "Skype"
HELPER_add_external_user_app_to_doc "Steam"
HELPER_add_external_user_app_to_doc "Discord"
HELPER_add_blankspaces_to_doc

# Media
HELPER_add_external_user_app_to_doc "Spotify"
HELPER_add_external_user_app_to_doc "VLC"
HELPER_add_external_user_app_to_doc "iMovie"
HELPER_add_external_user_app_to_doc "HandBrake"
HELPER_add_apple_default_app_to_doc "TV"
HELPER_add_blankspaces_to_doc

killall Dock
