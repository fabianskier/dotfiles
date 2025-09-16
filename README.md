## 🚀 Usage

This repository is managed with [GNU Stow](https://www.gnu.org/software/stow/).  
Each subdirectory (e.g. `zsh/`, `git/`, `nvim/`) contains configuration files that are symlinked into your `$HOME`.

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install GNU Stow
On macOS (with Homebrew):
```bash
brew install stow
```

### 3. Apply a module
For example, to set up Zsh:
```bash
stow zsh
```

This will create symlinks like:
```bash
~/.zshrc -> ~/dotfiles/zsh/.zshrc
~/.zshenv -> ~/dotfiles/zsh/.zshenv
~/.config/zsh/aliases.zsh -> ~/dotfiles/zsh/.config/zsh/aliases.zsh
```

### 4. Apply multiple modules
```bash
stow zsh git nvim
```

### 5. Remove a module
If you want to undo the symlinks:

```bash
stow -D zsh
```

### 6. Update configs
Simply edit the files inside ~/dotfiles/.
Then re-run stow if you add new ones.

## ⌨️ skhd (Hotkeys for Yabai)

This repository includes my `skhd` configuration to control [yabai](https://github.com/koekeishiya/yabai) with Vim-style keybindings.

### 🔹 Installation
```bash
brew install koekeishiya/formulae/skhd
brew services start skhd
```

### 🔹 Keybindings

| Keys                   | Action                               |
|------------------------|--------------------------------------|
| `alt + h/j/k/l`        | Focus window (left, down, up, right) |
| `alt + shift + h/j/k/l`| Swap window with neighbor            |
| `alt + 1..9`           | Move window to space N and focus it  |
| `alt + shift + 1..3`   | Move window to display N             |
| `alt + f`              | Toggle fullscreen (yabai zoom)       |
| `alt + space`          | Toggle float / tiling                |
| `alt + t`              | Toggle split orientation             |
| `alt + cmd + h/j/k/l`  | Resize window in that direction      |
| `alt + r`              | Balance all windows in current space |
| `alt + q`              | Restart yabai + skhd services        |
