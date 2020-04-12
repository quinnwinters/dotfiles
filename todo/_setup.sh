#!/bin/bash
brew install todo-txt

git clone https://github.com/quinnwinters/todo-folder ~/Documents/todo-folder
cat ./todo/todo.cfg.template > ~/.todo.cfg
cat ~/.zshrc todo/zsh-additions.template > ~/.zshrc
