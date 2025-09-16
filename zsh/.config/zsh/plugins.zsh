### Prompt
zinit ice from"gh-r" as"program" mv"starship* -> starship"
zinit light starship/starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship.toml

### Fuzzy finder
zinit ice from"gh-r" as"program" pick"fzf/bin/fzf"
zinit light junegunn/fzf
eval "$(fzf --zsh)"

### Smart cd
zinit ice from"gh-r" as"program" mv"zoxide-* -> zoxide"
zinit load ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

### Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

### Oh My Zsh snippet
zinit snippet OMZP::dotenv

### Atuin (shell history search)
eval "$(atuin init zsh)"