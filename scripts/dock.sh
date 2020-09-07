#!/bin/bash

defaults write com.apple.dock persistent-apps -array

##################################################################################################
# NOTE: You need to add the wait statements before running each command otherwise things are not #
# deterministic and the dock order is not actually guaranteed                                    #
##################################################################################################

function add_application_to_doc() {
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

function add_blankspaces_to_doc() {
    wait
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
}

add_blankspaces_to_doc

# Some basic Utilities
add_application_to_doc "1Password 7"
add_application_to_doc "Freedom"
add_application_to_doc "iStat Menus"
add_blankspaces_to_doc

# Regular applications
add_application_to_doc "Google Chrome"
add_application_to_doc "WhatsApp"
add_application_to_doc "Messenger"
add_application_to_doc "Notion"
add_application_to_doc "Todoist"
add_application_to_doc "Slack"
add_blankspaces_to_doc

# Coding applications
add_application_to_doc "Gitter"
add_application_to_doc "GitHub Desktop"
add_application_to_doc "Hyper"
add_application_to_doc "Docker"
add_application_to_doc "IntelliJ IDEA CE"
add_blankspaces_to_doc

# Video and Chat
add_application_to_doc "zoom.us"
add_application_to_doc "Skype"
add_application_to_doc "Steam"
add_application_to_doc "Discord"
add_blankspaces_to_doc

# Media
add_application_to_doc "Spotify"
add_application_to_doc "VLC"
add_application_to_doc "iMovie"
add_application_to_doc "HandBrake"
add_blankspaces_to_doc

killall Dock
