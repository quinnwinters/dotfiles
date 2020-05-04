#!/bin/bash
brew install todo-txt

TODO_DIR="/Users/quinnwinters/Documents/GitHub/quinnwinters-todo"

if [ ! -d "$TODO_DIR" ]; then
  echo "Cloning todo list"
  git clone git@github.com:quinnwinters/quinnwinters-todo $TODO_DIR
fi

ln -sf $(pwd)/todo.cfg ~/.todo.cfg
ln -sf $(pwd)/todoaliases ~/.aliases/todoaliases

ACTIONSDIR=$TODO_DIR/.todo.actions.d 
if [[ ! -d $ACTIONSDIR ]] ; then 
  echo "Creating todo actions directory"
  mkdir -vp $ACTIONSDIR 
fi

git clone git@github.com:DoctorRadar/todotxt_cli_date_add.git $ACTIONSDIR/add 
chmod +x $ACTIONSDIR/add/add

git clone git@github.com:rebeccamorgan/due.git $ACTIONSDIR/due 
chmod +x $ACTIONSDIR/due/due

git clone git@github.com:civrot/todo_txt_actions $ACTIONSDIR/standup
chmod +x $ACTIONSDIR/standup/standup

git clone git@github.com:tgdnt/stale $ACTIONSDIR/stale
chmod +x $ACTIONSDIR/stale/stale 

git clone git@github.com:timpulver/todo.txt-graph.git $ACTIONSDIR/graph

