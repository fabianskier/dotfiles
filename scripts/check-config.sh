#!/bin/bash

# Configuration validation script
# Checks if all required tools and configurations are in place

HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/opt/homebrew}
CHECKS_PASSED=0
CHECKS_FAILED=0

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

check_tool() {
    local tool=$1
    local name=$2

    if command -v "$tool" &>/dev/null; then
        echo -e "${GREEN}✓${NC} $name installed"
        ((CHECKS_PASSED++))
    else
        echo -e "${RED}✗${NC} $name NOT installed"
        ((CHECKS_FAILED++))
    fi
}

check_file() {
    local file=$1
    local name=$2

    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $name exists"
        ((CHECKS_PASSED++))
    else
        echo -e "${RED}✗${NC} $name NOT found at $file"
        ((CHECKS_FAILED++))
    fi
}

check_symlink() {
    local target=$1
    local name=$2

    if [ -L "$target" ]; then
        echo -e "${GREEN}✓${NC} $name symlinked"
        ((CHECKS_PASSED++))
    else
        echo -e "${YELLOW}⚠${NC} $name not symlinked (normal if using stow)"
    fi
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Configuration Validation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# Core tools
echo "Core Tools:"
check_tool "brew" "Homebrew"
check_tool "zsh" "Zsh"
check_tool "stow" "GNU Stow"

echo
echo "Shell Tools:"
check_tool "zoxide" "Zoxide"
check_tool "starship" "Starship"
check_tool "eza" "Eza"

echo
echo "Window Manager:"
check_tool "yabai" "Yabai"
check_tool "skhd" "Skhd"

echo
echo "Terminal:"
if [ -d "/Applications/Ghostty.app" ]; then
    echo -e "${GREEN}✓${NC} Ghostty installed"
    ((CHECKS_PASSED++))
else
    echo -e "${RED}✗${NC} Ghostty NOT installed"
    ((CHECKS_FAILED++))
fi

echo
echo "Configuration Files:"
check_file "$HOME/.config/zsh/conf.d/tools.zsh" "Zsh tools config"
check_file "$HOME/.config/zsh/conf.d/history.zsh" "Zsh history config"
check_file "$HOME/.config/zsh/conf.d/completions.zsh" "Zsh completions config"
check_file "$HOME/.config/starship.toml" "Starship config"
check_file "$HOME/.config/yabai/yabairc" "Yabai config"
check_file "$HOME/.config/skhd/skhdrc" "Skhd config"
check_file "$HOME/.config/ghostty/config" "Ghostty config"

echo
echo "Git Configuration:"
if [ -f "$HOME/.gitconfig" ]; then
    echo -e "${GREEN}✓${NC} Git config exists"
    ((CHECKS_PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Git config not found (run 'make use-work' or 'make use-personal')"
fi

echo
echo "Service Status:"
if launchctl list | grep -q "com.asmvik.yabai"; then
    echo -e "${GREEN}✓${NC} Yabai service running"
    ((CHECKS_PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Yabai service not running (run 'make yabai-config')"
fi

if launchctl list | grep -q "com.koekeishiya.skhd"; then
    echo -e "${GREEN}✓${NC} Skhd service running"
    ((CHECKS_PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Skhd service not running (run 'make yabai-config')"
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Summary: ${GREEN}$CHECKS_PASSED passed${NC}, ${RED}$CHECKS_FAILED failed${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $CHECKS_FAILED -eq 0 ]; then
    echo -e "${GREEN}All checks passed!${NC}"
    exit 0
else
    echo -e "${RED}Some checks failed. Review the output above.${NC}"
    exit 1
fi
