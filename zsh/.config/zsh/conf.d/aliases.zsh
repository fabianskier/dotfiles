# Useful aliases for development workflow

# Zoxide is initialized in tools.zsh
# Just use: z <name> to jump
# Or: zi for interactive selector

# Quick shortcuts
alias dt='z dotfiles'          # Jump to dotfiles
alias dw='z work'              # Jump to work

# Git aliases
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --oneline'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Listing
alias ll='eza -lah'           # Long list with hidden
alias la='eza -lA'            # All files except . and ..
alias l='eza -l'              # Long list
alias lh='eza -lh'            # Long list with human readable size

# Utilities
alias cat='bat'               # Use bat instead of cat
alias grep='grep --color=auto'
alias mkdir='mkdir -p'        # Create parent directories
alias cp='cp -i'              # Ask before overwrite
alias mv='mv -i'              # Ask before overwrite
alias rm='rm -i'              # Ask before delete

# Quick edits
alias zshconfig='nano ~/.zshrc'
alias dotconfig='cd ~/.dotfiles && nano README.md'

# Common commands
alias reload='exec zsh'        # Reload shell config
alias update='brew update && brew upgrade'
alias clean='brew cleanup'
