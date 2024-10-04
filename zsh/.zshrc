if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" || {
    echo "Failed to clone zinit repository."
    return 1
  }
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# asdf
. "$HOME/.asdf/asdf.sh"

# Plugins
# -------
# starship
zinit ice from"gh-r" as"program" mv"starship* -> starship"
zinit light starship/starship

# fzf
zinit ice from"gh-r" as"program" pick"fzf/bin/fzf"
zinit light junegunn/fzf

# zoxide
zinit ice from"gh-r" as"program" mv"zoxide-* -> zoxide"
zinit load ajeetdsouza/zoxide

# zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# dotenv
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dotenv/dotenv.plugin.zsh

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Do not require a leading ‘.’ in a filename to be matched explicitly.
setopt GLOB_DOTS

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

# Source/Load zsh extra files
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.local/zsh/secrets.conf ]] && source ~/.local/zsh/secrets.conf

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# coreutils
export PATH="opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# psql
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# install erlang documenation
export KERL_CONFIGURE_OPTIONS="--enable-docs --enable-man-docs --enable-ansi-docs"

# rust
. "$HOME/.cargo/env"
