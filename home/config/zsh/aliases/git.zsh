function current_branch() {
  git branch --show-current
}

function git_main_branch() {
  if [[ -n "$(git branch --list main)" ]]; then
    echo main
  else
    echo master
  fi
}

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gdf="ydiff -s -w0"
alias gf='git fetch --all --prune'

function gpull() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git gpull=git-checkout
alias gl=gpull

function gpullr() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}
compdef _git gpullr=git-checkout
alias glr=gpullr

function gpush() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git gpush=git-checkout
alias gp=gpush

function gpushf() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push --force origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push --force origin "${b:=$1}"
  fi
}
compdef _git gpushf=git-checkout
alias gpf=gpushf
