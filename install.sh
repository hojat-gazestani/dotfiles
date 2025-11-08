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

install_zsh() {
  warning_message "Updating packages"
  sudo apt update -qq -y  || { error_message "Updating packages failed; exiting"; }

  warning_message "Installing zsh and dependencies"
  sudo apt install zsh build-essential curl file git git-core curl fonts-powerline -qq -y || { error_message "Installing zsh failed; exiting"; }

  warning_message "Checking zsh Installation"
  zsh --version || { error_message "Checking zsh Installation failed; exiting"; }
}

set_default_shell() {
  warning_message "Seting Zsh as Default Shell"
  chsh -s $(which zsh) || { error_message "Seting Zsh as Default Shell failed; exiting"; }
}

install_oh_my_zsh() {
  warning_message "Install Oh My Zsh"
  #sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { error_message "Install Oh My Zsh failed; exiting"; }
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || { error_message "Install Oh My Zsh failed; exiting"; }
}

install_zsh_plugins() {
  local zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  warning_message "Installing Auto-Suggestions"
  if [ ! -d "$zsh_custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$zsh_custom/plugins/zsh-autosuggestions" || { error_message "Enable Auto-Suggestions failed; exiting"; }
  else
    warning_message "zsh-autosuggestions already installed, skipping..."
  fi

  warning_message "Installing Syntax Highlighting"
  if [ ! -d "$zsh_custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$zsh_custom/plugins/zsh-syntax-highlighting" || { error_message "Enable Syntax Highlighting failed; exiting"; }
  else
    warning_message "zsh-syntax-highlighting already installed, skipping..."
  fi

  warning_message "Installing zsh you-should-use plugin"
  if [ ! -d "$zsh_custom/plugins/you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$zsh_custom/plugins/you-should-use" || { error_message "Installing zsh you should use failed; exiting"; }
  else
    warning_message "you-should-use already installed, skipping..."
  fi
}

install_starship() {
  warning_message "Installing starship"
  if command_exists starship; then
    warning_message "starship already installed, skipping..."
  else
    curl -sS https://starship.rs/install.sh | sh -s -- -y || { error_message "Installing starship failed; exiting"; }
  fi
}

main() {
  echo "Starting Zsh environment setup..."
  echo "========================================"

  install_zsh
  install_oh_my_zsh
  set_default_shell
  install_zsh_plugins
  install_starship

  echo "========================================"
  success_message "Zsh environment setup completed successfully!"
  echo ""
}

main
