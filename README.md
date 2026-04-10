# Dotfiles

Personal macOS configuration files managed with GNU Stow.

## Quick Start

### Setup Workflow (3 minutes)

**Step 1: Clone and install (~2 minutes)**
```bash
git clone https://github.com/fabianskier/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```

This installs:
- ✅ Homebrew and all packages
- ✅ All dotfiles (symlinked with stow)
- ✅ Terminal theme (Catppuccin Mocha)
- ✅ Mission Control hotkeys (Ctrl+1-6, etc.)
- ✅ Yabai window manager

**Step 2: Create 5 workspaces (~30 seconds, manual)**
```
1. Press F3 (Mission Control)
2. Click + button in top-right
3. Repeat until you have 5 desktops
```

**Step 3: Verify everything**
```bash
make check
```

That's it! Ready to use.

### Environment Selection

Switch between work and personal Git configs:
```bash
make use-work      # Configure for work
make use-personal  # Configure for personal
make git-status    # Check current config
```

## What's Included

### Terminal & Shell
- **zsh** - Shell with custom config
- **zoxide** - Smarter cd navigation
- **starship** - Fast, minimal prompt
- **eza** - Modern ls replacement
- **zsh-autosuggestions** - Command suggestions
- **zsh-syntax-highlighting** - Syntax highlighting

### Terminal Emulator
- **Ghostty** - Fast terminal emulator
- **Catppuccin Mocha** - Color theme

### Window Manager
- **Yabai** - Tiling window manager
- **skhd** - Hotkey daemon for Yabai

### Terminal Multiplexer
- **tmux** - Session management and multiplexing
- **Catppuccin Mocha** - Color theme

### Fonts
- **JetBrains Mono Nerd Font** - Development font

## Configuration Structure

```
dotfiles/
├── zsh/                 # Shell configuration
│   └── .config/zsh/
├── starship/           # Prompt configuration
│   └── .config/starship/
├── ghostty/            # Terminal emulator config
│   └── .config/ghostty/
├── neovim/             # Neovim editor config (WIP)
│   └── .config/nvim/
├── tmux/               # Terminal multiplexer config
│   └── .config/tmux/
├── yabai/              # Window manager config
│   ├── .config/yabai/
│   └── .config/skhd/
├── git/                # Git configuration
├── scripts/            # Setup scripts
├── Brewfile            # Homebrew packages
├── Makefile            # Setup automation
└── README.md          # This file
```

## Keyboard Shortcuts

### Shell/Terminal (zsh)
- `Ctrl+A` - Start of line
- `Ctrl+E` - End of line
- `Ctrl+R` - Search history
- `Alt+F` - Forward word
- `Alt+B` - Backward word

### Window Manager (Yabai + skhd)
| Action | Shortcut |
|--------|----------|
| Focus Left | Alt+H |
| Focus Down | Alt+J |
| Focus Up | Alt+K |
| Focus Right | Alt+L |
| Move Left | Alt+Shift+H |
| Move Down | Alt+Shift+J |
| Move Up | Alt+Shift+K |
| Move Right | Alt+Shift+L |
| Fullscreen | Alt+F |
| Layout: BSP | Alt+B |
| Layout: Stack | Alt+S |
| Equalize | Alt+E |
| Float Toggle | Alt+T |

### Mission Control (macOS)
| Action | Shortcut |
|--------|----------|
| Switch to Desktop 1-9 | Ctrl+1-9 |
| Move window to Desktop 1-9 | Ctrl+Shift+1-9 |
| Next Desktop | Ctrl+→ |
| Previous Desktop | Ctrl+← |

**Multi-Monitor Setup:**
- Laptop alone: 1-5 desktops
- Laptop + Monitor: up to 9 desktops (4-5 per monitor)
- Each monitor has independent desktop spaces
- Hotkeys work on whichever monitor is active

### Terminal Multiplexer (tmux)
| Action | Shortcut |
|--------|----------|
| Prefix | Ctrl+A |
| New Window | `prefix c` |
| Select Pane Left | Alt+H (or `prefix h`) |
| Select Pane Down | Alt+J (or `prefix j`) |
| Select Pane Up | Alt+K (or `prefix k`) |
| Select Pane Right | Alt+L (or `prefix l`) |
| Split Vertical | `prefix v` |
| Split Horizontal | `prefix s` |
| Reload Config | `prefix r` |

## Makefile Targets

```bash
make install          # Full setup (default)
make brew            # Install Homebrew and packages
make stow            # Link dotfiles with GNU Stow
make themes          # Download terminal themes
make macos-defaults  # Configure macOS hotkeys
make yabai-config    # Configure Yabai and skhd
make use-work        # Switch to work Git config
make use-personal    # Switch to personal Git config
make git-status      # Show current Git config
make check           # Validate configuration
```

## Multi-Machine Setup

For different machines (work vs personal), create machine-specific overrides:

```bash
# In ~/.dotfiles/
mkdir -p local/
cp zsh/.config/zsh/conf.d/tools.zsh local/tools.zsh.work
# Edit local/tools.zsh.work with machine-specific settings
```

Then in your main config, source the local version if it exists.

## First Time Setup

1. **Clone the repo:**
   ```bash
   git clone https://github.com/fabianskier/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run setup:**
   ```bash
   make install
   ```

3. **Configure Git:**
   ```bash
   make use-work    # or use-personal
   git config --global user.name "Your Name"
   git config --global user.email "your@email.com"
   ```

4. **Restart terminal/Yabai:**
   ```bash
   exec zsh
   ```

5. **Verify everything:**
   ```bash
   make check
   ```

## System Requirements

- macOS (Monterey or newer)
- Xcode Command Line Tools
- Homebrew
- ~2GB free disk space

## Troubleshooting

### Yabai Permission Denied
If you get "Permission denied" errors with Yabai, reconfigure:
```bash
make yabai-config
```

### zsh shortcuts not working
Reload zsh configuration:
```bash
exec zsh
```

### Stow conflicts
If stow can't create symlinks:
```bash
make stow --verbose
```

### Git config issues
Check current config:
```bash
make git-status
```

Reset and reconfigure:
```bash
make use-personal
```

## Manual Steps

Some things still require manual configuration:

- **Terminal Preferences**: Open Ghostty preferences if color theme doesn't apply
- **Yabai SIP**: For full Yabai functionality on personal machine, disable SIP ([instructions](https://github.com/asmvik/yabai/wiki/Installing-yabai-(latest-release)))
- **System Preferences**: Check keyboard shortcuts in System Settings > Keyboard

## Updates

Keep dotfiles updated:
```bash
cd ~/.dotfiles
git pull
make install  # Re-apply all configurations
```

## License

Personal configuration files. Use as inspiration for your own setup!

## Notes

- Configurations are heavily customized for personal workflow
- Some settings are macOS-specific
- Designed for development-focused workflow
- Yabai requires some manual SIP configuration for full features
