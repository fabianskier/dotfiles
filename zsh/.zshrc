# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions 
# installation: `brew install zsh-autosuggestions`
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# zsh-syntax-highlighting
# installation: `brew install zsh-syntax-highlighting`
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(dotenv)

# Starship 
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml
