#!/usr/bin/env bash

if [[ ! -f "$HOME"/.backup_history ]]; then
    touch "$HOME"/.backup_history
    echo "0" >>"$HOME"/.backup_history
fi

last_run=$(tail -n 1 "$HOME"/.backup_history)
today_ts=$(date +%s)
days_since_run=$((($today_ts - $last_run) / 86400))

if [[ $days_since_run > 30 ]]; then
    mackup backup --force
    curdir=$(pwd)
    cd $DOT_DIR
    current_branch=$(git branch --list | grep -i "*" | tr -d "* ")
    git add .
    git commit --quiet -m "chore: Automated backup on $(date +'%Y-%m-%d')"
    backup_branch="chore/automated-backups-$(date +'%Y-%m-%d')"
    git checkout --quiet -b $backup_branch
    git push -u origin $backup_branch
    git checkout $current_branch
    echo "\n$(date +%s)" >>"$HOME"/.backup_history
fi
