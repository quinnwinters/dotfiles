#!/bin/bash
brew install todo-txt

TODO_DIR="/Users/quinnwinters/Documents/GitHub/quinnwinters-todo"

if [ ! -d "$TODO_DIR" ]; then
  echo "Cloning todo list"
  git clone git@github.com:quinnwinters/quinnwinters-todo $TODO_DIR
fi

ln -s $(pwd)/todo.cfg ~/.todo.cfg
ln -s $(pwd)/todoaliases ~/.aliases/todoaliases

ACTIONSDIR=$TODO_DIR/.todo.actions.d 
if [[ ! -d $ACTIONSDIR ]] ; then 
  echo "Creating todo actions directory"
  mkdir -vp $ACTIONSDIR 
fi

git clone git@github.com:DoctorRadar/todotxt_cli_date_add.git $ACTIONSDIR/add 
chmod +x $ACTIONSDIR/add/add

curl -k https://raw.githubusercontent.com/todotxt/todo.txt-cli/addons/.todo.actions.d/addx > $ACTIONSDIR/addx
chmod +x $ACTIONSDIR/addx

git clone git@github.com:timpulver/todo.txt-graph.git $ACTIONSDIR/graph

