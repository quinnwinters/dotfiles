#!/usr/bin/env bash
osascript -e 'tell application "System Preferences" to quit'

echo "It requires admin password to change OS level configs"
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

sudo ./__appearence.sh
sudo ./__energy.sh
sudo ./__finder.sh
sudo ./__internationalization.sh
sudo ./__missioncontrol.sh
sudo ./__trackpad.sh
sudo ./__typing.sh
sudo ./__ux.sh

killall Dock
killall Finder 
