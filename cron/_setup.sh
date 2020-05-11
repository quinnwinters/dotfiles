#!/bin/bash

CDIR=$(pwd)

if [[ ! -d "~/.cron" ]] ; then
    mkdir -vp ~/.cron
fi

CRONLOC=~/.cron/jobs
crontab -l > $CRONLOC

echo "30 8 * * * sh $DOT_DIR/cron/scripts/email_me_todos.sh" >> $CRONLOC
echo "0 16 * * 5 sh $DOT_DIR/cron/scripts/email_me_accomplishments" >> $CRONLOC
echo "0 0 * * 0 sh $DOT_DIR/cron/scripts/update_homebrew.sh" >> $CRONLOC

echo "Setting up cron file using the following configuration:"
cat $CRONLOC

cat $CRONLOC | uniq | crontab -
