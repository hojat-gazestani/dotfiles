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

warning_message "Updating packages"
#sudo apt update -qq -y  || { error_message "Updating packages failed; exiting"; }

warning_message "Installing zsh"
#sudo apt install zsh -qq -y || { error_message "Installing zsh failed; exiting"; }

warning_message "Checking zsh Installation"
#zsh --version || { error_message "Checking zsh Installation failed; exiting"; }

warning_message "Seting Zsh as Default Shell"
#chsh -s $(which zsh) || { error_message "Seting Zsh as Default Shell failed; exiting"; }

warning_message "Install Oh My Zsh"
#sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { error_message "Install Oh My Zsh failed; exiting"; }

warning_message "Enabling Auto-Suggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { error_message "Enable Auto-Suggestions failed; exiting"; }

warning_message "Enabling Syntax Highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { error_message "Enable Syntax Highlighting failed; exiting"; }