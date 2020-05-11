#!/bin/bash

curdir=$(pwd)

if [[ -z "$MYEMAIL" ]] ; then
    echo "Unable to detect email"
    exit 1
fi

if [[ -z "$TODO_DIR" ]] ; then
    echo "Unable to locate todo directory"
    exit 1
fi

echo "Going to todo git location"
cd $TODO_DIR

echo "Getting todo upstream updates"
git pull

SUBJECT="[TODO] Tasks for $(date +'%Y-%m-%d')"
echo "Creating and sending email with subject $SUBJECT"
/usr/local/opt/todo-txt/bin/todo.sh -d ~/.todo.cfg -a -f -p ls | mutt $MYEMAIL -s "$SUBJECT"

echo "Finished sending email, now updating remote"
git add -u
git commit -m "$SUBJECT"
git push

echo "Finished, returning to $curdir"
cd $curdir
