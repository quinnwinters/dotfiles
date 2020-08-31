#!/bin/bash

echo "You have the following tmux sessions open"
echo "-----------------------------------------"
tmux ls
echo ""
echo "Since you are about to program, you should create a session or attach to"
echo "an existing session. Type the name of the session to attach or create"
echo "(Suggestions: {project}-{branch})"
read -r name

function HELPER_tmux_load_session() {
    session="$@"

    if [ ! $(tmux has-session -t "$session") ] ; then
        echo "Creating tmux session session=$session"
        tmux new -s "$session" -d
    fi

    if [ ! $TMUX ] ; then
        echo "No current tmux session, attaching to session=$session"
        tmux attach -t "$session"
    else
        echo "Current tmux session is session=$(tmux display-message -p '#S')"
        echo "Switching to session=$session"
        tmux switch -t "$session"
    fi
}

HELPER_tmux_load_session $name

