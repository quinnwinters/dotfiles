#!/bin/bash

echo "You have the following tmux sessions open"
echo "-----------------------------------------"
tmux ls
echo ""
echo "Since you are about to program, you should create a session or attach to"
echo "an existing session. Type the name of the session to attach or create"
echo "(Suggestions: {project}-{branch})"
read -r session

tmux new-session -A -s $session


