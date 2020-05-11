#!/bin/bash

curdir=$(pwd)
if [[ -z "$MYEMAIL" ]] ; then
    echo "Unable to find email"
    exit 1
fi

if [[ -z "$TODO_DIR" ]] ; then
    echo "Unable to find todo directory"
    exit 1
fi

cd $TODO_DIR

echo "Updating todos with changes from remote"
git pull


SUBJECT="[TODO] $(date +'%Y-%m-%d') - Weekly Accomplishments"
echo "Sending email with subject $SUBJECT"
echo "
Graph of weekly accomplishments:
---
$(/usr/local/opt/todo-txt/bin/todo.sh -d ~/.todo.cfg -a -f -p graph)

Accomplished tasks
---
$(/usr/local/opt/todo-txt/bin/todo.sh -d ~/.todo.cfg -a -f -p ls | grep x)

Current Projects
---
$(/usr/local/opt/todo-txt/bin/todo.sh -d ~/.todo.cfg -a -f -p listproj)
" | mutt $MYEMAIL -s "$SUBJECT"

echo "Archiving tasks that you completed this week"
/usr/local/opt/todo-txt/bin/todo.sh -d ~/.todo.cfg -a -f -p archive

echo "Finished email and archiving todos. Updating remote"
git add -u
git commit -m "$SUBJECT"
git push

cd $curdir
