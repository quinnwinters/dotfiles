#!/bin/bash

if [[ ! -z "$MYEMAIL" ]] ; then 
    exit 1
fi

if [[ ! -z "$TODO_DIR" ]] ; then 
    exit 1
fi 

cd $TODO_DIR

git pull 

SUBJECT="[TODO] $(date +'%Y-%m-%d') - Weekly Accomplishments"
echo "
Graph of weekly accomplishments:
---
$(t graph)

Accomplished tasks
---
$(t ls | grep x)

Current Projects
---
$(t listproj)
" > | mutt $MYEMAIL -s $SUBJECT 

t archive

git add . 
git commit -m "$SUBJECT"
git push

