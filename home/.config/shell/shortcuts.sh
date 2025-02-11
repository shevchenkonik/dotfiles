# Common Aliases
alias c="clear"
alias q="exit"
alias rmrf="rm -rf"
alias ls="eza --icons=always"
alias lsa="ls -lhFaG"
alias dev="cd ~/Projects"

alias lls='eza -lh --group-directories-first --icons --hyperlink'
alias llsa='lls -a'
alias llt='eza --tree --level=2 --long --icons --git'
alias llta='llt -a'

# Navigation Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Common Aliases
alias day="/usr/libexec/corebrightnessdiag nightshift-internal | awk '/sunrise|sunset/ {print $4}'"

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