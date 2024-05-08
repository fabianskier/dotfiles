# brew
export PATH="/opt/homebrew/bin:$PATH"

# gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# coreutils
export PATH="opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# psql
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# zoxide
eval "$(zoxide init zsh)"
