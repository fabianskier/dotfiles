# Vi keybindings
bindkey -v

# Show mode indicator in prompt
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne "\e]50;CursorShape=2\x7"  # Block cursor in normal mode
  else
    echo -ne "\e]50;CursorShape=1\x7"  # Beam cursor in insert mode
  fi
}

zle -N zle-keymap-select

# Reduce key timeout to 100ms for faster mode switching
export KEYTIMEOUT=10
