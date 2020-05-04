#!/usr/bin/env bash 

sudo pmset -a lidwake 1
sudo pmset -a autorestart 1
sudo systemsetup -setrestartfreeze on
sudo pmset -c sleep 0
sudo pmset -b sleep 5
sudo pmset -a standbydelay 86400
sudo systemsetup -setcomputersleep Off > /dev/null
sudo pmset -a hibernatemode 0
sudo rm /private/var/vm/sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage

defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
