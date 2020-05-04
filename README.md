# Setup and Dotfiles

This is a collection of setup scripts and dotfiles that I use when re-imaging my
personal computer and making sure that my development environments are unified
across all the different computers that I use (work, personal, VMs etc).

## Usage

The main script here will install and reset things as well. You can run the
whole script fairly easily with just

```bash
sudo ./dotfiles.sh
```

You have to use `sudo` just because a lot of the various different sub-tasks
requrie it. If you want to run sub-tasks individually that's fairly simple as
well. You can just run `./{directory}/_setup.sh`.

The "modules" as well as their documentation is pretty simple. Each one is
intentially self-contained (i.e. does a bunch of checks for dependency installs
before running).

There's self contained installation/configuration scripts for:

- [Homebrew](./homebrew/_setup.sh)
- [Vim](./vim/_setup.sh)
- [Zsh](./zsh/_setup.sh)
- [Git](./git/_setup.sh)
- [Tmux](./tmux/_setup.sh)
- [Python](./python/_setup.sh)
- [Java & Scala](./jvm/_setup.sh)
- [LaTeX](./latex/_setup.sh)
- [iTerm2](./iterm2/_setup.sh)
- [Todo.Txt](./todo/_setup.sh)
- [MacOS](./macos/_setup.sh)
- [Google Drive File System](./google-drive/_setup.sh)
- [Alfred](./alfred/_setup.sh)
- [Mutt](./mutt/_setup.sh)
- [Cron](./cron/_setup.sh)
