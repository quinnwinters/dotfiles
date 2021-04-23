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


function __autocomplete_branch() {
    git branch --list 
}

function HELPER_checkout_if_exists_or_create() {
    git fetch --all --quiet
    if [[ $# == 1 ]] ; then 
        branch="$1"
	exists=$(git show-ref refs/heads/$branch)
	if [ -n "$exists" ]; then
    	    git checkout $branch
	else 
	   read "Branch $branch does not exist. Current branches are:\n $(git branch --list). Do you want to create $branch [y/n]? " -n 1 -r 
	   if [[ $REPLY == ^[Yy]$ ]] ; then 
		git checkout -b $branch
	   fi 
	fi
    else
	git branch "$@"
    fi
}
alias gco=HELPER_checkout_if_exists_or_create

function HELPER_create_if_new_else_checkout() {
    git fetch --all --quiet
    if [[ $# == 1 ]] ; then 
	branch="$1"
	exists=$(git show-ref refs/heads/$branch)
	if [[ -n "$exists" ]] ; then 
	    read "Branch $branch already exists. Do you mean to check it out [y/n]? " -n 1 -r
	    if [[ $REPLY == ^[Yy]$ ]] ; then 
		git checkout $branch
	    else 
		git checkout -b $branch
	    fi
	else
	    git checkout -b $branch
	fi 
    else 
	git chekcout $@
    fi 
}
alias gcb=HELPER_create_if_new_else_checkout
