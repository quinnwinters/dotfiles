## [v1.0.0](v1.0.0) - 2020-08-09
### Added
- opening scripts for iterm2 profiles that force you to use tmux (or use todo-txt profile for tmux) ([#15](https://github.com/quinnwinters/dotfiles/pull/15))
- logging statements in script files ([#15](https://github.com/quinnwinters/dotfiles/pull/15))
- A large number of opinionated calculus shortcuts for latex ([#17](https://github.com/quinnwinters/dotfiles/pull/17))
- Added dotbot-ghq to standardize cloning git repos for me ([#32](https://github.com/quinnwinters/dotfiles/pull/32))
- Added dotbot-conda with conda-environments that are right now just basic ([#32](https://github.com/quinnwinters/dotfiles/pull/32))
- Empty hyperterm layout and link to proper spot for hyperterm plugin to pick up ([#34](https://github.com/quinnwinters/dotfiles/pull/34))
- Dotbot hyper plugins that I care about ([#34](https://github.com/quinnwinters/dotfiles/pull/34))
- Submodule for ([#34](https://github.com/quinnwinters/dotfiles/pull/34))
- new exa for listing files in a very pretty way ([#31](https://github.com/quinnwinters/dotfiles/pull/31))
- new alias for trashing: use tm like rm ([#31](https://github.com/quinnwinters/dotfiles/pull/31))
- Better brewfile to be used with brewfile wrapping ([#31](https://github.com/quinnwinters/dotfiles/pull/31))
- script for setting up vundle plugins in git ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- script for fixing macos default settings ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- script to setup oh-my-zsh ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- script to setup google drive filesystem ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- script to setup github access over ssh (required for ghq cloning) ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- Added new coding shortcut ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- crontab file to configure cronjobs ([#50](https://github.com/quinnwinters/dotfiles/pull/50))
- Backup workflow for dotfiles ([#50](https://github.com/quinnwinters/dotfiles/pull/50))
- Mackup files for Spotify, Magnet, Bartender ([#55](https://github.com/quinnwinters/dotfiles/pull/55))
- Mackup config ([#55](https://github.com/quinnwinters/dotfiles/pull/55))
- Mackup restore script for install-config.yaml ([#55](https://github.com/quinnwinters/dotfiles/pull/55))
- Mackup backup script for cron job ([#55](https://github.com/quinnwinters/dotfiles/pull/55))
- Step to change wallpaper in os setup script ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- Symlink for media folder (profile pictures + wallpapers) ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- More aliases for ghq ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- Mackup backup configs ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- Documentation file ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- ghq autobackup via an alias for ghq function ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Several useful alfred themes and workflows ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Alfred backup to the ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Organization directory tooling/ to actually store all the dotbot submodules ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- some default repos to ghq ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- Alfred workflow for toggling hidden files ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- Alfred workflow for github search ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- Alfred workflow for docker container management ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- gibo for gitignore boilerplating ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- update automation script for brew+conda ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- hyper visor settings ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- better settings for hyper transparent ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- hyper.js settings ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- new shell session script for tmux ([#48](https://github.com/quinnwinters/dotfiles/pull/48))

### Deprecated
- Removed pip from dotbots ([#32](https://github.com/quinnwinters/dotfiles/pull/32))
- dotbot-pip to be removed now that dotbot-conda is in play ([#31](https://github.com/quinnwinters/dotfiles/pull/31))
- Profiles for different brewfiles ([#31](https://github.com/quinnwinters/dotfiles/pull/31))

### Fixed
- fixed ([#15](https://github.com/quinnwinters/dotfiles/pull/15))
- Moved brewfile to the proper location and set for auto-updates with ([#32](https://github.com/quinnwinters/dotfiles/pull/32))
- minor error in the latex shortcuts ([#31](https://github.com/quinnwinters/dotfiles/pull/31))
- Updated ghq update script to work better ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- Set default to use ssh for github to avoid ghq issues with cloning ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- Fixed ghq install script -&gt; minimal clones, with ~/.ghqrepos available for cloning if needed ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- Fixed ghq update script ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- changed some small hyper.js setttings ([#50](https://github.com/quinnwinters/dotfiles/pull/50))
- Changed install order to ensure that scripts that need certain linked files ran after linking files ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- Read me should accurately reflect setup process ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- Changed all relative paths to absolute paths, and all absolute paths to use ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- NERD Tree should show hidden files ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- Made Google Drive symlinking automatic for directories ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- Updated readme ([#59](https://github.com/quinnwinters/dotfiles/pull/59))
- Fixed setup script to force use proper ghq repo and latest version of homebrew ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Fixed ordering issues for tasks within install config ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Removed -a from exa/ls version ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Added missing ~/.bashrc which caused zsh complaints ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Made gitconfig work better with ghq ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- ghq to use ~/.ghqrepos file ([#36](https://github.com/quinnwinters/dotfiles/pull/36))
- Updated ghq update script to work better ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- ghq backup workflow so that ghqfile works and backups work as well ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- Alfred workflow for killing processes (switched to better workflow ([#41](https://github.com/quinnwinters/dotfiles/pull/41))

### Removed
- unused scripts ([#44](https://github.com/quinnwinters/dotfiles/pull/44))
- Removed Visual Studio Code -&gt; should be using and optimizing vim workflows whenever possible ([#40](https://github.com/quinnwinters/dotfiles/pull/40))
- uninstall hyper-quit ([#53](https://github.com/quinnwinters/dotfiles/pull/53))
- todo.txt config ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- todo.txt aliases -- moving to notion for task management and reminders for reminders ([#57](https://github.com/quinnwinters/dotfiles/pull/57))
- visual-studio-code --&gt; Need to learn vim better and never will if vs code is available ([#41](https://github.com/quinnwinters/dotfiles/pull/41))
- Mackup support ([#43](https://github.com/quinnwinters/dotfiles/pull/43))
- hyper-sync-settings -- redundent ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- weekly automation emails ([#48](https://github.com/quinnwinters/dotfiles/pull/48))
- brew update from ./setup script runs ([#48](https://github.com/quinnwinters/dotfiles/pull/48))

### Changed
- moved scripts for cron jobs to sub folder and updated paths ([#15](https://github.com/quinnwinters/dotfiles/pull/15))
- Removed all the parts from latex template that I don&#39;t use ([#17](https://github.com/quinnwinters/dotfiles/pull/17))
- Changed from header -&gt; template ([#17](https://github.com/quinnwinters/dotfiles/pull/17))
- Default screenshots now in Pictures ([#19](https://github.com/quinnwinters/dotfiles/pull/19))
- Changed alias for LS to be a fancy tree ([#21](https://github.com/quinnwinters/dotfiles/pull/21))
- Some minor piping aliases ([#57](https://github.com/quinnwinters/dotfiles/pull/57))

### Docs
- Rewrote read me to be more clear/up to date with dotbot working definitions ([#32](https://github.com/quinnwinters/dotfiles/pull/32))

### Refactor
- Use Dotbot for Automation Instead of Shell Scripts ([#27](https://github.com/quinnwinters/dotfiles/pull/27))



## [1](1) - 2020-05-05
### Added
- Cron documentation ([#11](https://github.com/quinnwinters/dotfiles/pull/11))
- Cron documentation ([#11](https://github.com/quinnwinters/dotfiles/pull/11))
- Merge pull request #12 from quinnwinters/restyled/qwinters/cron-docs

Restyle  Cron documentation ([#11](https://github.com/quinnwinters/dotfiles/pull/11))
- Aliases for all the changelogg tags ([#13](https://github.com/quinnwinters/dotfiles/pull/13))
- Aliases for all the changelogg tags ([#13](https://github.com/quinnwinters/dotfiles/pull/13))



