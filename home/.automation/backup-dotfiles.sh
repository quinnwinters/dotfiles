#!/bin/bash

cd $DOT_DIR

git checkout qwinters/backup
git merge master
git add -u
git commit -m "Automated backup: `date`"
git push -u origin qwinters/backup
git checkout master
git pull

