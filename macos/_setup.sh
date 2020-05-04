#!/usr/bin/env bash
osascript -e 'tell application "System Preferences" to quit'

echo "It requires admin password to change OS level configs"
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

./__appearence.sh
./__energy.sh
./__finder.sh
./__internationalization.sh
./__missioncontrol.sh
./__trackpad.sh
./__typing.sh
./__ux.sh

killall Dock
killall Finder 
