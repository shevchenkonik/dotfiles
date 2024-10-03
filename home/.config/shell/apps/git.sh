alias gti="git"
alias g="git "
alias gs="git status"
alias ga="git add "
alias gb="git branch "
alias gp="git push "
alias gc="git commit -m "

# Initialize git repository and make an initial commit
function ginit() {
    git init && git commit -m "Initial commit" --allow-empty
}