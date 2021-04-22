function HELPER_tmux_launcher() {
  if [[ $# -eq 1 ]]; then
    session=$1
  else
    tmux ls
    echo "Choose your session or specify a new one:\n"
    read session
  fi

  tmux has-session -t $session 2>/dev/null
  if [[ $? != 0 ]]; then
    tmux new-session -s $session -d
  fi

  if [[ -n "$TMUX" ]]; then
    tmux switch -t $session
  else
    tmux attach -t $session
  fi
}
alias tm-session="HELPER_tmux_launcher"
alias tm="tm-session"
alias tms="tmux switch -t"

function HELPER_tmux_gh_edit_session() {
  code_loc=$(ghq root)
  exa --tree --level=3 --recurse --only-dirs $code_loc
  echo ""
  echo "Choose a project to open"
  read project_input

  num_projects=$(ghq list | grep -i $project_input | wc -l | sed -e 's/^[ \t]*//')

  while [[ ! $num_projects == 1 ]]; do
    if [[ $num_projects -gt 1 ]]; then
      echo "Invalid input - '$project_input' was ambiguous. Please specify more of the path"
    else
      echo "Invalid input - '$project_input' was not found. Please enter a valid project"
    fi
    read project_input
    num_projects=$(ghq list | grep -i $project_input | wc -l | sed -e 's/^[ \t]*//')
  done

  project_name=$(ghq list | grep -i $project_input)
  project=$(echo $project_name | tr -c "[:alpha:][:digit:]\n" "-")
  project_path="$code_loc/$project_name"
  tmux has-session -t $project 2>/dev/null
  if [[ $? != 0 ]]; then
    tmux new -s $session -d
    tmux split-window -v
    tmux send -t $session "cd $project_path" Enter
    tmux resize-pane -D 15
    tmux select-pane -U
    tmux send -t $session "cd $project_path && vim ." Enter
  fi
  if [[ -n "$TMUX" ]]; then
    tmux switch -t $project
  else
    tmux attach -t $project
  fi
}
alias tm-project="HELPER_tmux_gh_edit_session"

function HELPER_tmux_gtop() {
  session="gtop"
  tmux has-session -t $session 2>/dev/null
  if [[ $? == 0 ]]; then
    tmux new -s $session -d
    tmxu send -t $session "gtop" Enter
  fi
  if [[ -n "$TMUX" ]]; then
    tmux switch -t $session
  else
    tmux attach -t $session
  fi
}
alias tm-top="HELPER_tmux_gtop"

function HELPER_tmux_ranger() {
  session="ranger"
  tmux has-session -t $session 2>/dev/null
  if [[ $? == 0 ]]; then
    tmux new -s $session -d
    tmxu send -t $session "ranger" Enter
  fi
  if [[ -n "$TMUX" ]]; then
    tmux switch -t $session
  else
    tmux attach -t $session
  fi
}
alias tm-ranger="HELPER_tmux_ranger"

function HELPER_tmux_ssh() {
  echo "Enter a enter your ssh host (and flags!)"
  read cmd
  cmd=$(echo "$cmd" | sed -e 's/\s*ssh//g' | sed -e 's/^[ \t]*//')
  ts=$(isoTimestamp)
  session=$("ssh $cmd ($ts)" | tr -c "[:alpha:][:digit:]:" "-")
  tmux new-session -s $session -d
  tmux send -t "ssh $cmd" Enter
  if [[ -n "$TMUX" ]]; then
    tmux switch -t $session
  else
    tmux attach -t $session
  fi
}
alias tm-ssh="HELPER_tmux_ssh"

# Call this script and pass a text file with a list of servers. You will ssh to the servers as the current user.
# Once connected use Ctrl + a to enter commands
# de/syncronize panes = Ctrl + a + s
# Change panes = Ctrl + a + arrow-keys
# Zoom into pane = Ctrl + a + z
function parallel_tmux_file() {
  parallel_tmux $(cat $1)
}

function parallel_tmux() {
  tmux new-session -s $(date +"%F_%H-%M-%S") -d
  count=-1
  for i in "${@}"; do
    let count=${count}+1
    if [ $count -eq 0 ]; then
      tmux new-window "ssh $i"
    else
      tmux split-window -h "ssh $i"
      tmux select-layout tiled
    fi
  done
  tmux set-window-option synchronize-panes on
  tmux attach
}
alias pt=parallel_tmux
alias ptf=parallel_tmux_file
