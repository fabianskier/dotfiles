# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Listing
alias ls="eza --icons"
alias ll="eza -la --icons"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

# Git
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"

# Utilities
alias reload="source ~/.zshrc"
alias grep="grep --color=auto"
alias cat="bat"   # if bat is installed