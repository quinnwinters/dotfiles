#!/bin/bash

if [[ ! -z "$MYEMAIL" ]] ; then 
    exit 1
fi

if [[ ! -z "$TODO_DIR" ]] ; then 
    exit 1
fi 

cd $TODO_DIR

git pull 

SUBJECT="[TODO] $(date +'%Y-%m-%d')"
echo "$(t ls)" > | mutt $MYEMAIL -s $SUBJECT 

git add . 
git commit -m "$SUBJECT"
git push
