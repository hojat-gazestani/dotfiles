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
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
  rm ~/.zshrc
fi
[ ! -e ~/.config/.zshrc ] && ln -s "$PWD/config/.zshrc" ~/.zshrc
[ ! -e ~/.config/ripgreprc ] && ln -s "$PWD/config/ripgreprc" ~/.config/ripgreprc

# Link .vimrc
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
  rm ~/.vimrc
fi
[ ! -e ~/.vimrc ] && ln -s "$PWD/config/.vimrc" ~/.vimrc
