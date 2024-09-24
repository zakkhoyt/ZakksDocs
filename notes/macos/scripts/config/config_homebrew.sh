#!/bin/bash

# install homebrew
xcode-select --install
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# add homebrew to PATH
# shellcheck disable=SC2088,SC1090
export PATH="/opt/homebrew/bin:$PATH" >> "~/.zshrc" && source "~/.zshrc"

# Install packages


brew install exa
brew install python
brew install jq
brew install yq
brew install gnu-sed

brew install gh

## Xcodes (GUI and command line)
brew install xcodes
brew install --cask xcodes

brew install --cask hammerspoon
brew install --cask blender

