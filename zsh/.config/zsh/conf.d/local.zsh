# Local machine-specific configuration
# This file is sourced last to override other settings

# Machine-specific aliases, functions, and environment variables go here
# Examples:
# export MY_WORK_API_KEY="..."
# alias work-vpn="sudo openvpn ..."

# Load local overrides if they exist
LOCAL_CONFIG="$HOME/.dotfiles.local"
if [ -f "$LOCAL_CONFIG" ]; then
    source "$LOCAL_CONFIG"
fi
