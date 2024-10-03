# Common Aliases
alias c="clear"
alias q="exit"
alias rmrf="rm -rf"
alias lsa="ls -lhFaG"

# Navigation Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Creates a new directory and enters it
function mkd() {
    mkdir -p $@ && cd $_
}

# Print all aliases
function printAliases() {
    local result=""

    if [[ $# -eq 0 ]]; then
        result=$(alias)
    else
        result=$(alias | rg "^$@")
    fi

    if [[ -z "$result" ]]; then
        which "$@"
    else
        echo "Aliases:"
        echo "$result"
        echo
        echo "Which:"
        which "$@"
    fi
}