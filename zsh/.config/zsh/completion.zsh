# Initialize completions
autoload -Uz compinit
compinit
zinit cdreplay -q

# Styles
zstyle ':completion:*' async yes
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab integration
zstyle ':fzf-tab:*' fzf-flags '--bind=enter:accept'
zstyle ':fzf-tab:*' popup-min-size 50 8
zstyle ':fzf-tab:*' popup-pad 30 0
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' switch-group '<' '>'

# Previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'