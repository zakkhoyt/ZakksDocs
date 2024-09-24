#!/bin/bash

# See [DEFAULTS.md]($HOME/Documents/notes/shell/DEFAULTS.md)
# jazon zurita: https://github.com/jasonzurita/computer-setup

# To increse keyboard speed
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Dock snappy animation
# Reference: https://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/
defaults write com.apple.dock tilesize -int 52 # make the dock size feel just right
defaults write com.apple.Dock autohide -bool TRUE # turn on autohide dock
defaults write com.apple.Dock autohide-delay -float 0.1
defaults write com.apple.Dock orientation -string left

# Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Reveal Library folder in Finder
chflags nohidden ~/Library/
defaults write com.apple.finder QuitMenuItem -bool TRUE
defaults write com.apple.finder QuitMenuItem -bool TRUE

# Disable .DS_Store files
# https://www.techrepublic.com/article/how-to-disable-the-creation-of-dsstore-files-for-mac-users-folders/
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Xcode opens without opening previous session
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# # Menu bar
# defaults write com.apple.menuextra.battery ShowPercent YES # show battery percent
# killall SystemUIServer


killall Dock # restart the dock to pick up the above modifications