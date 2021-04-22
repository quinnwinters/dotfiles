# Optional Aliases
alias ls="exa --long --classify --group-directories-first --bytes --header --links --git --time-style=long-iso"
alias vim='nvim'
alias reload="exec $SHELL -l"
alias isoTime='date +"%H:%M:%SZ"'
alias isoTimestamp='date +"%Y-%m-%dT%H:%M:%SZ"'
alias isoDate='date +"%Y-%m-%d"'

# Given a file, detects what type it is and:
# 1) cd's to it if it's a directory
# 2) opens it in Vim if it's a text file
# 3) throws an error if it's a binary file
function smart_open {
    filepath="${1}"
    if ! [ -e "${filepath}" ]; then
        echo "Error: No such file at '${filepath}'" >&2
        return 1
    fi

    filetype="$(file "${filepath}" | awk '{print $NF}')"
    return_code=0
    case "${filetype}" in
    text)
        vim "${filepath}"
        ;;
    directory)
        cd "${filepath}"
        ;;
    *)
        open "${filepath}"
        ;;
    esac
    return "${return_code}"
}
alias open="smart_open"
