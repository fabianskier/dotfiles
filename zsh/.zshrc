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

# Plugins
# -------
zinit ice from"gh-r" as"program" mv"starship* -> starship"
zinit light starship/starship

zinit ice from"gh-r" as"program" pick"fzf/bin/fzf"
zinit light junegunn/fzf

zinit ice from"gh-r" as"program" mv"zoxide-* -> zoxide"
zinit load ajeetdsouza/zoxide

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dotenv/dotenv.plugin.zsh

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Zsh History Configuration
# -------------------------
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Completion Styling
# ------------------
zstyle ':fzf-tab:*' fzf-flags '--bind=enter:accept'
zstyle ':fzf-tab:*' popup-min-size 50 8
zstyle ':fzf-tab:*' popup-pad 30 0
zstyle ':completion:*' async yes
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' switch-group '<' '>'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

# ASDF configuration for managing Elixir, Erlang, etc.
. $HOME/.asdf/asdf.sh

# Source extra files
[[ -f ~/.zshenv ]] && source ~/.zshenv
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.local/zsh/secrets.conf ]] && source ~/.local/zsh/secrets.conf

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export ZDOTDIR=$HOME
