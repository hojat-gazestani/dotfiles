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

warning_message "Installing Required Packages"
sudo apt update -qq -y || { error_message "Installation Required Packages failed"; }
sudo apt install apt-transport-https ca-certificates  curl -qq -y || { error_message "Installation Required Packages failed"; }

warning_message "Adding Docker’s Official GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg || { error_message "Add Docker’s Official GPG Key"; }

warning_message "Setting Up Docker’s Stable Repository"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

warning_message "Updating repository"
sudo apt update -qq -y || { error_message "Updating packages failed; exiting"; }

warning_message "Installing Docker Engine"
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -qq -y || { error_message "Install Docker Engine failed"; }

warning_message "Starting Docker service"
sudo systemctl start docker || { error_message "Starting Docker service failed"; }
sudo systemctl enable docker || { error_message "Enabling Docker service failed"; }


warning_message "Checking if docker is active"
sudo systemctl is-active docker || { error_message "Docker is not active"; }

warning_message "Adding ${USER} to docker group"
sudo usermod -aG docker ${USER} || { error_message "Adding ${USER} to docker group failed"; }

warning_message "Verify Docker Version"
docker --version || { error_message "Docker verification failed"; }

warning_message "Verify Docker Compose Plugin Version"
docker compose version || { error_message "Docker Compose Plugin verification failed"; }

success_message "Docker installation completed successfully!"
