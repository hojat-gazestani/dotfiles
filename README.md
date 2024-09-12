# Dotfiles Configuration Repository

This repository contains scripts and configuration files to set up and manage your development environment. It automates the installation of essential tools and links configuration files to their respective locations.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Configuration](#configuration)
- [Scripts](#scripts)
  - [Install.sh](#installsh)
  - [Setup.sh](#setupsh)
- [Customization](#customization)
- [License](#license)

## Overview

This repository is designed to simplify the setup of a development environment by providing scripts to install necessary tools and link configuration files (dotfiles) to their appropriate locations. The setup is primarily intended for systems running a Linux distribution, but it can be adapted for other environments.

## Installation

### Prerequisites

Before running the scripts, ensure you have the following installed:

- **Git**: Version control system to clone this repository.
- **Bash**: The scripts are written in Bash. Ensure it's installed on your system.
- **Zsh**: Z Shell, which will be installed by the script if not already present.

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/hojat-gazestani/dotfiles.git
   cd dotfiles

2. **Run the Install Script:**

    ```bash
    ./Install.sh
    ```

3. **Run the Setup Script:**

    ```bash
    ./setup.sh
