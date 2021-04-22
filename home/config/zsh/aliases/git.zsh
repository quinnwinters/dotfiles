# Git aliases
function HELPER_git_status_default() {
    git fetch --all --quiet
    if [[ $# == 0 ]]; then
        git status
    else
        git $@
    fi
}
alias g=HELPER_git_status_default

function HELPER_push_origin_default() {
    git fetch --all --quiet
    if [[ $# == 0 ]]; then
        current_branch=$(git branch --list | grep -i "*" | tr -d "* ")
        git push -u origin $current_branch
    else
        git push $@
    fi
}
alias gp=HELPER_push_origin_default

alias gaa='git add --all'
alias gl='git pull'
