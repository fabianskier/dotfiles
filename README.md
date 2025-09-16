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

