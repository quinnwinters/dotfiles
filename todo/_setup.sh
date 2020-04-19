#!/bin/bash
brew install todo-txt

TODO_DIR="/Users/quinnwinters/Documents/Todo"

if [ ! -d $TODO_DIR ] ; then
    echo "Couldn't find google drive syncing todo directory as expected. Creating a new directory for local use"
    mkdir -p $TODO_DIR
    mkdir -p $TODO_DIR/.todo.actions.d
    touch $TODO_DIR/todo.txt
    touch $TODO_DIR/done.txt
    touch $TODO_DIR/report.txt

fi

cat ./todo/todo.cfg.template > ~/.todo.cfg
cat ~/.zshrc todo/zsh-additions.template > ~/.zshrc
