# Returns the __ most-recently-modified files
function NEWEST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '-tr' 'tail' "$NUM_RESULTS"
}
alias LATEST="NEWEST"

# Returns the __ least-recently-modified files
function OLDEST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '-tr' 'head' "$NUM_RESULTS"
}
alias EARLIEST="OLDEST"

# Returns the __ first files alphabetically from ls
function FIRST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '' 'head' "$NUM_RESULTS"
}

# Returns the __ last files alphabetically from ls
function LAST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '' 'tail' "$NUM_RESULTS"
}

# Returns the __ biggest files by filesize
function BIGGEST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '-Sr' 'head' "$NUM_RESULTS"
}

# Returns the __ smallest files by filesize
function SMALLEST {
    if [[ $# -eq 0 ]]; then
        NUM_RESULTS=1
    else
        NUM_RESULTS=$1
    fi
    _ls_results '-Sr' 'tail' "$NUM_RESULTS"
}
