# History configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

# Share history between sessions
setopt APPEND_HISTORY          # Append to history file instead of overwriting
setopt INC_APPEND_HISTORY      # Append to history file immediately
setopt SHARE_HISTORY           # Share history across all sessions
setopt HIST_IGNORE_DUPS        # Don't record duplicate commands
setopt HIST_IGNORE_SPACE       # Ignore commands that start with space
setopt HIST_FIND_NO_DUPS       # Don't show duplicates when searching history
