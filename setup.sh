#!/bin/sh
# Enable shell script strictness
set -eu
# Enable command tracing
set -x
# Ensure config directory exists
mkdir -p ~/.config
# Link Git config if it doesn’t exist
[ ! -e ~/.config/git ] && ln -s "$PWD/config/git" ~/.config/git
[ ! -e ~/.config/starship.toml ] && ln -s "$PWD/config/starship.toml" ~/.config/starship.toml
[ ! -e ~/.config/.zshrc ] && ln -s "$PWD/config/.zshrc" ~/.zshrc
