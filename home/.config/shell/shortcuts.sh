alias c="clear"
alias q="exit"

alias rmrf="rm -rf"

alias p="cd ~/Projects"

alias ls="eza --icons=always"
alias lsa="ls -lhFaG"
alias lls='eza -lh --group-directories-first --icons --hyperlink'
alias llsa='lls -a'
alias llt='eza --tree --level=2 --long --icons --git'
alias llta='llt -a'
alias l.="eza -a | grep -E '^\.'"

# Copy SSH public key to pasteboard
alias cssh="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> SSH Public Key copied to pasteboard'"

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