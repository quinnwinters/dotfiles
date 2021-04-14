## Installation

When installing please run the following scripts in order (you can copy-paste
below into a bash script if you want, but its recommended you test things between
scripts to make sure things aren't broken)

```shell
./scripts/environment/setup-shell-tools 	# No need to test
./scripts/environment/setup-local-exports 	# No need to test
./scripts/environment/setup-github-ssh 		# Test github connection by cloning a repo
./scripts/environment/setup-onedrive-docs 	# Test docs syncing in finder
./scripts/environment/setup-dotfile-links 	# Test anything except for vim


./scripts/install/install-brew-apps 		# No need to test
./scripts/install/install-brew-cask 		# No need to test
./scripts/install/install-brew-mas 		# No need to test
./scripts/install/install-ghq-repos 		# No need to test
./scripts/install/install-node-clis 		# No need to test
./scripts/install/install-vim-plugins 		# A good time to test that vim doesn't break

./scripts/preferences/setup-mac-dock		# No need to test, just look at dock
./scripts/preferences/setup-macos-prefs 	# No need to test, but might need to adjust things in systems prefs still 
```
