# QWINTERS MacOS Dotfiles

A simple and easy way to setup my dotfiles using dotbot. The config is located
at `install-config.yaml` and the main install shell script is the simple `setup`
file (note these dotfiles will not work on non-Mac systems).

## Install

To install, all you have to do is run the following command in your terminal:

```
git clone https://github.com/quinnwinters/dotfiles ~/dotfiles && sh ~/dotfiles/setup
```

## Steps in Installation

* Remove old symlinks
* Add new directories as needed
* Install homebrew formulae
* Link dotfiles
* Setup github over ssh 
* Tweak MacOS preferences
* Load vim/vundle plugins
* Setup Oh-my-zsh
* Mount Google Drive and link documents folder
* Schedule regular cron jobs
* Create conda environments
* Add hyper plugins
* Clone/update repos with ghq

## Some specifics

### Directory structure

I'm opinionated so I like to have my directory structure look like the following:
```
/Users/quinnwinters:
    Code:
        github.com:
            quinnwinters:
                <repos>
            <other organizations/user code folders>
    Documents:
        dotfiles
        <directories from google drive>

```


