# Initialize zoxide with cd replacement
# --cmd cd makes zoxide replace the cd command
# This means cd becomes smart (uses history) automatically
eval "$(zoxide init zsh --cmd cd)"

# Initialize starship prompt
eval "$(starship init zsh)"