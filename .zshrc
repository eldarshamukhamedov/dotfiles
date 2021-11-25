# ZSH configs
export ZSH=$HOME/.oh-my-zsh
export FORCE_COLOR=1
export ZSH_DISABLE_COMPFIX=true
export ZSH_THEME="aperture"
eval $(dircolors $HOME/.dircolors)
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Node/NPM/PNPM configs
export PNPM_BIN_DEST=$HOME/.pnpm-cache/bin
export PNPM_DEST=$HOME/.pnpm-cache

# Aliases
alias ll="LC_COLLATE=C ls -lha --group-directories-first --color=auto"
alias gs="git status"
alias gb="gci"
alias ifconfig="ip address show"
alias tmx="tmux new-session -A -s main"
alias ap="cd /workspaces/aperture-public"
