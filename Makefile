SHELL := /bin/bash
HOMEBREW_PREFIX := /opt/homebrew

.PHONY: all install brew stow use-work use-personal git-status

# Full setup on a new Mac
install: brew stow

# Install Homebrew if missing, then install Brewfile dependencies
brew:
	@if ! command -v brew &>/dev/null; then \
		echo "→ Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "→ Homebrew already installed"; \
	fi
	@echo "→ Installing packages from Brewfile..."
	$(HOMEBREW_PREFIX)/bin/brew bundle

# Symlink all directories using stow
stow:
	@echo "→ Linking dotfiles with stow..."
	@shopt -s nullglob; \
	for dir in */; do \
		name=$${dir%/}; \
		[[ "$$name" == .* ]] && continue; \
		echo "  stow $$name"; \
		$(HOMEBREW_PREFIX)/bin/stow --restow "$$name"; \
	done

# Git configuration management
use-work:
	@echo "→ Configurando Git para TRABAJO..."
	@cp ~/.gitconfig-work ~/.gitconfig
	@echo "✓ Config seteada"
	@git config user.name && git config user.email

use-personal:
	@echo "→ Configurando Git para PERSONAL..."
	@cp ~/.gitconfig-personal ~/.gitconfig
	@echo "✓ Config seteada"
	@git config user.name && git config user.email

git-status:
	@echo "Git config actual:"
	@git config user.name
	@git config user.email