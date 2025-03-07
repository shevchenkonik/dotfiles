# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set English language as main for the terminal
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"