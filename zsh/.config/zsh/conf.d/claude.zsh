# Claude Code CLI integration

# Quick aliases
alias cl='claude'                          # Shorthand
alias clc='claude -c'                      # Continue last conversation
alias clf='claude --dangerously-skip-permissions'  # Full auto (use with care)

# Ask Claude about a file
# Usage: clfile archivo.py "que hace esto?"
clfile() {
  local file="$1"
  shift
  claude "$@" < "$file"
}

# Ask Claude to explain the last command's output
# Usage: run-something 2>&1 | clexplain
clexplain() {
  local input=$(cat)
  claude "Explica este output y si hay errores como resolverlos:\n\n$input"
}

# Open Claude in the context of the current git repo
# Usage: clrepo "agrega tests para el modulo auth"
clrepo() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    claude "$@"
  else
    echo "No estas en un repositorio git"
    return 1
  fi
}

# Quick commit with Claude-generated message
# Usage: clcommit
clcommit() {
  local diff=$(git diff --cached)
  if [[ -z "$diff" ]]; then
    echo "No hay cambios staged. Usa: git add <archivos>"
    return 1
  fi
  local msg=$(echo "$diff" | claude -p "Genera un mensaje de commit conciso en formato convencional (feat/fix/chore/etc). Solo el mensaje, sin explicacion.")
  echo "Mensaje sugerido: $msg"
  echo -n "Usar este mensaje? [y/N] "
  read confirm
  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    git commit -m "$msg"
  fi
}
