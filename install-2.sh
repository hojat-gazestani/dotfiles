#!/bin/bash

warning_message "Enabling Auto-Suggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { error_message "Enable Auto-Suggestions failed; exiting"; }

warning_message "Enabling Syntax Highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { error_message "Enable Syntax Highlighting failed; exiting"; }

warning_message "Installing starship"
curl -sS https://starship.rs/install.sh | sudo sh || { error_message "Installing starship failed; exiting"; }

warning_message "Cloning zsh you should use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use || { error_message "Installing zsh you should use failed; exiting"; }

