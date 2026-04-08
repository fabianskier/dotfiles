#!/bin/bash

# macOS defaults configuration
# Sets up Mission Control hotkeys and ensures 5 workspaces

PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"
DESIRED_SPACES=5

echo "→ Configuring macOS Mission Control..."
echo ""

# Disable animations for faster workspace switching
echo "→ Optimizing macOS for speed..."

# Mission Control and Spaces
defaults write com.apple.dock workspaces-auto-swoosh -bool false       # No animation between spaces
defaults write com.apple.dock mru-spaces -bool false                   # Don't rearrange spaces
defaults write com.apple.dock expose-animation-duration -float 0       # Instant Expose

# General animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Dock
defaults write com.apple.dock autohide-delay -float 0                  # Instant dock show
defaults write com.apple.dock show-recents -bool false                 # Hide recent apps

# Finder
defaults write com.apple.finder DisableAllAnimations -bool true

echo "✓ macOS optimized for speed"
echo ""

# Backup original plist
if [ ! -f "$PLIST.backup" ]; then
    cp "$PLIST" "$PLIST.backup"
    echo "✓ Backup created"
fi

# Check spaces (informational only)
echo "→ Checking Mission Control spaces..."

# Try to count spaces
CURRENT_SPACES=$(osascript -e 'tell application "System Events" to count spaces of desktop 1' 2>/dev/null || echo "unknown")

if [ "$CURRENT_SPACES" != "unknown" ] && [ "$CURRENT_SPACES" -lt "$DESIRED_SPACES" ]; then
    NEEDED=$((DESIRED_SPACES - CURRENT_SPACES))
    echo "  ⚠ Current spaces: $CURRENT_SPACES (need $NEEDED more)"
    echo ""
    echo "  📌 To create more spaces:"
    echo "     1. Open Mission Control (F3)"
    echo "     2. Click the + button in top-right corner"
    echo "     3. Repeat until you have $DESIRED_SPACES total spaces"
    echo ""
elif [ "$CURRENT_SPACES" != "unknown" ]; then
    echo "✓ You have $CURRENT_SPACES spaces (good!)"
else
    echo "  ℹ Could not auto-detect spaces"
    echo "  Verify you have at least $DESIRED_SPACES spaces in Mission Control (F3)"
fi

echo ""

# Function to add hotkey using PlistBuddy
add_hotkey() {
    local key=$1
    local keycode=$2
    local modifier=$3
    local flags=$4

    /usr/libexec/PlistBuddy -c "Add :$key dict" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :$key:enabled true" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :$key:value dict" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :$key:value:parameters array" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :$key:value:parameters:0 integer $keycode" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :$key:value:parameters:1 integer $modifier" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :$key:value:parameters:2 integer $flags" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :$key:value:type string standard" "$PLIST" 2>/dev/null || true
}

# Switch to Desktop 1-6 with Ctrl+1-6
# Key 60-65, keycodes 49-54 (1-6), modifier 59 (Ctrl), flags 262144
for i in {0..5}; do
    key=$((60 + i))
    keycode=$((49 + i))
    add_hotkey "$key" "$keycode" "59" "262144"
done
echo "✓ Configured Ctrl+1-6 for Desktop switching"

# Move window to Desktop 1-6 with Ctrl+Shift+1-6
# Key 66-71, keycodes 49-54 (1-6), modifier 59 (Ctrl), flags 786432 (Ctrl+Shift)
for i in {0..5}; do
    key=$((66 + i))
    keycode=$((49 + i))
    add_hotkey "$key" "$keycode" "59" "786432"
done
echo "✓ Configured Ctrl+Shift+1-6 for Moving windows"

# Switch to next desktop with Ctrl+Right (key 124, keycode 124)
add_hotkey "124" "124" "59" "262144"
echo "✓ Configured Ctrl+→ for next Desktop"

# Switch to previous desktop with Ctrl+Left (key 123, keycode 123)
add_hotkey "123" "123" "59" "262144"
echo "✓ Configured Ctrl+← for previous Desktop"

# Reload preferences
killall -KILL cfprefsd 2>/dev/null || true
sleep 1

echo ""
echo "✓ macOS Mission Control hotkeys configured"
echo "  Ctrl+1-6: Switch to Desktop N"
echo "  Ctrl+Shift+1-6: Move window to Desktop N"
echo "  Ctrl+← / Ctrl+→: Previous/Next Desktop"
echo ""
echo "Note: May require logout/login to take full effect"
