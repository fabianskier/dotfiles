SHELL := /bin/bash
HOMEBREW_PREFIX := /opt/homebrew

.PHONY: all install brew stow themes macos-defaults use-work use-personal git-status check java

# Full setup on a new Mac
install: brew stow themes macos-defaults

# Install Homebrew if missing, then install Brewfile dependencies
brew:
	@if ! command -v brew &>/dev/null; then \
		echo "→ Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "→ Homebrew already installed"; \
	fi
	@echo "→ Adding taps..."
	$(HOMEBREW_PREFIX)/bin/brew tap felixkratz/formulae
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

# Configure macOS defaults
macos-defaults:
	@echo "→ Configuring macOS defaults..."
	@bash scripts/macos-defaults.sh


# Install Java (optional, large download)
java:
	@echo "→ Installing OpenJDK 21..."
	$(HOMEBREW_PREFIX)/bin/brew install openjdk@21
	@echo "✓ OpenJDK 21 installed"

# Validate configuration
check:
	@echo "→ Validating configuration..."
	@bash scripts/check-config.sh

# Download themes
themes:
	@echo "→ Downloading Catppuccin themes for Ghostty..."
	@mkdir -p $(HOME)/.config/ghostty/themes
	@curl -fsSL https://raw.githubusercontent.com/catppuccin/ghostty/main/themes/catppuccin-mocha.conf -o $(HOME)/.config/ghostty/themes/catppuccin-mocha.conf
	@echo "✓ Catppuccin Mocha downloaded"