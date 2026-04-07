SHELL := /bin/bash
HOMEBREW_PREFIX := /opt/homebrew

.PHONY: all install brew themes stow

# Full setup on a new Mac
install: brew themes stow

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