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

# Download external themes (not tracked in repo)
themes:
	@echo "→ Installing Catppuccin Macchiato theme for kitty..."
	@mkdir -p ~/.config/kitty/themes
	@curl -fsSL https://raw.githubusercontent.com/catppuccin/kitty/main/themes/macchiato.conf \
		-o ~/.config/kitty/themes/macchiato.conf

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
