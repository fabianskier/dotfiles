# Homebrew Environment
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set PATH for gnu-sed, coreutils, and Postgres
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Rust Environment
. "$HOME/.cargo/env"

# Erlang Shell History
export ERL_AFLAGS="-kernel shell_history enabled"

# KERL for Erlang Documentation
export KERL_CONFIGURE_OPTIONS="--enable-docs --enable-man-docs --enable-ansi-docs"

export PATH="$HOME/.asdf/shims:$PATH"
