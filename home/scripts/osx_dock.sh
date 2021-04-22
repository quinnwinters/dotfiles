#!/user/bin/env bash

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DOT_DIR/media/wallpaper-1.jpg\""
defaults write com.apple.dock persistent-apps -array

function HELPER_add_apple_default_app_to_dock() {
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

function HELPER_add_external_user_app_to_dock() {
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

function HELPER_reset_dock() {
    HELPER_add_external_user_app_to_dock "Authy Desktop"
    HELPER_add_external_user_app_to_dock "1Password 7"
    HELPER_add_external_user_app_to_dock "Brave Browser"
    HELPER_add_external_user_app_to_dock "Firefox"
    HELPER_add_external_user_app_to_dock "Signal"
    HELPER_add_apple_default_app_to_dock "Music"
    HELPER_add_apple_default_app_to_dock "Podcasts"
    HELPER_add_external_user_app_to_dock "VLC"
    HELPER_add_external_user_app_to_dock "Microsoft OneNote"
    HELPER_add_apple_default_app_to_dock "Preview"
    HELPER_add_external_user_app_to_dock "iTerm"

    if [[ ! -d "$HOME"/.cmd_history ]]; then
        mkdir -p "$HOME"/.cmd_history
    fi
    echo "\n$(date +%s)" >>"$HOME"/.cmd_history/HELPER_reset_dock

    killall Dock
}
