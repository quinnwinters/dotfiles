#!/usr/bin/env bash 

if [[ ! -f "$HOME"/.update_history ]] ; then 
    touch "$HOME"/.update_history
    echo "0" >> "$HOME"/.update_history
fi 

last_run=$(tail -n 1 "$HOME"/.update_history)
today_ts=$(date +%s)
days_since_run=$((($today_ts - $last_run) / 86400))

if [[ $days_since_run > 15 ]] ; then 
    for f in "$HOME"/.scripts/*.sh ; do 
        sh $f
    done
    echo "\n$(date +%s)" >> "$HOME"/.update_history
fi