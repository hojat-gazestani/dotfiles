#!/bin/bash

# ANSI escape sequences for setting background and font colors
error_msg="\033[41;37m"
success_msg="\033[32;40m"
warning_msg="\033[33;40m"
reset="\033[0m"


# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to print warning message
warning_message() {
  echo -e "${warning_msg}Warning: $1${reset}" >&2
}

# Function to print error message and exit
error_message() {
  echo -e "${error_msg}Error: $1${reset}" >&2
  exit 1
}

# Function to print success message
success_message() {
  echo -e "${success_msg}Success: $1${reset}" >&2
}

# Enable shell script strictness
set -eu
# Enable command tracing
set -x

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/config"

# Ensure config directory exists in dotfiles
if [ ! -d "$CONFIG_DIR" ]; then
  error_message "Config directory not found at $CONFIG_DIR"
  exit 1
fi

# Ensure config directory exists
mkdir -p ~/.config

create_symlink() {
  local source_file="$1"
  local target_file="$2"
  local description="$3"

  if [ ! -e "$source_file" ]; then
    warning_message "Source file $source_file does not exist, skipping $description" >&2
    return 1
  fi

  if [ -L "$target_file" ]; then
    current_target="$(readlink "$target_file")"
    if [ "$current_target" = "$source_file" ]; then
      success_message "Symlink for $description already exists and is correct."
      return 0
    else
      echo "Updating symlink for $description..."
      rm "$target_file"
    fi
  elif [ -e "$target_file" ]; then
    echo "Backing up existing $description..."
    mv "$target_file" "$target_file.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  echo "Creating symlink for $description..."
  ln -s "$source_file" "$target_file"
  success_message "Successfully linked $description"
}

# Create symlink
create_symlink "$CONFIG_DIR/git" "$HOME/.config/git" "Git config"
create_symlink "$CONFIG_DIR/starship.toml"  "$HOME/.config/starship.toml" "Starship config"
create_symlink "$CONFIG_DIR/.zshrc" "$HOME/.zshrc" "Zsh config"
create_symlink "$CONFIG_DIR/ripgreprc" "$HOME/.config/ripgreprc" "Ripgrep config"
create_symlink "$CONFIG_DIR/.vimrc" "$HOME/.vimrc" "Vim config"

# Additional macOS-specific configuration
if [ "$(uname)" = "Darwin" ]; then
    echo "macOS detected, applying additional configurations..."

    # Link macOS-specific files if they exist
    if [ -d "$CONFIG_DIR/macos" ]; then
        create_symlink "$CONFIG_DIR/macos/terminal" "$HOME/Library/Preferences/com.apple.Terminal.plist" "Terminal preferences" 2>/dev/null || true
    fi
fi

echo ""
success_message "Dotfiles setup completed successfully!"
echo "   Restart your terminal or run 'source ~/.zshrc' to apply changes"
