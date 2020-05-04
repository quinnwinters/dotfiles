#!/bin/bash

CDIR=$(pwd)

if [[ ! -d "~/.cron" ]] ; then 
    mkdir -vp ~/.cron 
fi

CRONLOC=~/.cron/jobs
crontab -l > $CRONLOC

echo "30 8 * * * sh $CDIR/email_me_todos.sh" >> $CRONLOC
echo "0 16 * * 5 sh $CDIR/email_me_accomplishments" >> $CRONLOC
echo "0 0 * * 0 sh $CDIR/update_homebrew.sh" >> $CRONLOC


cat $CRONLOC | uniq | crontab -
