# Set English language as main for the terminal
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

alias pip=/usr/local/bin/pip3
alias webstorm="/Users/nikshevchenko/Applications/WebStorm.app/Contents/MacOS/webstorm"

# Import NPM related aliases
source ~/.config/shell/apps/npm.sh

# Import Git related aliases
source ~/.config/shell/apps/git.sh

# Import common shortcut aliases
source ~/.config/shell/shortcuts.sh

source ~/.config/shell/myip.sh

source ~/.zprofile

source ~/.config/shell/apps/starship.sh

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  zsh-you-should-use
)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

eval "$(zoxide init zsh)"
alias lzd='lazydocker'
