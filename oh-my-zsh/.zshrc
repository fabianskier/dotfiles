# Personal zsh configuration of Oscar Cristaldo <fabianskier@icloud.com>

#------------------------------------------------------------------------
# Oh My Zsh
#------------------------------------------------------------------------

# Documentation: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#automatic-title
# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="norm"
plugins=(git)

# Completion settings
COMPLETION_WAITING_DOTS=true

# Library settings
HIST_STAMPS="%d/%m/%Y"

source $ZSH/oh-my-zsh.sh

#------------------------------------------------------------------------
# Development tools configuration
#------------------------------------------------------------------------

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm

#export RAILS_ENV=test

# gnu-sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# psql
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# rbenv
# eval "$(rbenv init - zsh)"

# shims
export PATH="/Users/fabianskier/.rbenv/shims:$PATH"

# stylua
export PATH="/usr/local/bin/stylua:$PATH"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

#------------------------------------------------------------------------
# Aliases
#------------------------------------------------------------------------

alias z="nvim ~/.zshrc"
alias n="nvim ~/.config/nvim/init.lua"
alias k="nvim ~/.config/kitty/kitty.conf"
alias so="source ~/.zshrc"
alias a="cd ~/Documents/Development/amplify.tmp"
alias f="cd ~/Documents/Development/fabianskier.tmp"
alias mdg="mix deps.get"
alias mid="(cd apps/conversion_interface/assets && npm install)"
alias mer="mix ecto.reset"
alias mps="mix phx.server"
alias mas="mdg && mid && mer && mps"
alias mr="mer && mps"
alias pga='cd /Users/fabianskier/Documents/onehq.tmp/pg_activity && . .venv/bin/activate && pg_activity'
alias ex10="cp ~/.tool-version.10 ~/.tool-versions && elixir -v"
alias ex11="cp ~/.tool-version.11 ~/.tool-versions && elixir -v"
alias ls="ls -G --color"
alias iex23="asdf global erlang 23.3.4.18 && asdf global elixir 1.10.3-otp-23"
alias iex25="asdf global erlang 25.1.2 && asdf global elixir 1.14.2-otp-25"

# Git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gr='git restore'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glol='git log --pretty=oneline --abbrev-commit'
alias gcs='git commit -S'

#------------------------------------------------------------------------
# Environment variables
#------------------------------------------------------------------------

# aws s3
export AWS_ACCESS_KEY_ID=<your_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>

# dev database
export DB_HOST=<your_db_host>
export DB_USERNAME=<your_db_username>
export DB_PASSWORD=<your_db_password>

# contrib
export CONTRIB_SYS_USER=<your_contrib_sys_user>
export CONTRIB_SYS_PASSWORD=<your_contrib_sys_password>

# vapor database variables
POSTGRES_DATABASE_HOST=<your_postgres_database_host>
POSTGRES_DATABASE_PORT=<your_postgres_database_port>
POSTGRES_DATABASE_USERNAME=<your_postgres_database_username>
POSTGRES_DATABASE_PASSWORD=<your_postgres_database_password>
POSTGRES_DATABASE_NAME=<your_postgres_database_name>

#.npmrc
export NPM_TOKEN=<your_npm_token>

# pg_analyze
export PGANALYZE_PASSWORD=<your_pganalyze_password>

# userfront
export USERFRONT_API_KEY=<your_userfront_api_key>