# ZSH configs
export ZSH=$HOME/.oh-my-zsh
FORCE_COLOR=1
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="aperture"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
alias ll="LC_COLLATE=C ls -lha --group-directories-first --color=auto"
alias gs="git status"
alias gb="gci"
alias ifconfig="ip address show"
alias tmx="tmux new-session -A -s main"
alias ap="cd /workspaces/aperture-public"
