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

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Import NPM related aliases
source .config/shell/apps/npm.sh

# Import Git related aliases
source .config/shell/apps/git.sh

# Import common shortcut aliases
source .config/shell/shortcuts.sh

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

# pnpm
export PNPM_HOME="/Users/nikshevchenko/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:/Users/nikshevchenko/.spicetify
export DENO_INSTALL="/Users/nikshevchenko/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nikshevchenko/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nikshevchenko/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nikshevchenko/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nikshevchenko/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2024-09-27 14:54:24
export PATH="$PATH:/Users/nikshevchenko/.local/bin"
