# Load all config files
for file in $HOME/.config/zsh/conf.d/*.zsh; do
  source "$file"
done
