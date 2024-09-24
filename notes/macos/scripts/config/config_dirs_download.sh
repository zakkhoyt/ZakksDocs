#!/bin/bash

# Container dir "temp"
mkdir -p "$HOME/temp"

# ---- ~/Downloads will be converted to a symbolic link under ~/temp

OLD_DOWNLOADS_DIR="$HOME/Downloads"
NEW_DOWNLOADS_DIR="$HOME/temp/_downloads"

# Create new Downloads dir and symbolic link to mimmic macOS setup.
mkdir -p "$NEW_DOWNLOADS_DIR"
# Move any downloaded dirs/files to new home
mv "$OLD_DOWNLOADS_DIR/*" "$NEW_DOWNLOADS_DIR" 
# Delete existing (now empty) downloads dir
sudo rm -rf "$OLD_DOWNLOADS_DIR"
# Replace with symbolic link
ln -s "$NEW_DOWNLOADS_DIR" "$OLD_DOWNLOADS_DIR"

# ---- Torrents

# Save torrents in "temp/torrent"
mkdir -p "$HOME/temp/_torrent"

# ---- Pictures / Images

ln -s "$HOME/Documents/Images/screenshots" "$HOME/Pictures/screenshots/_iCloud"
ln -s "$HOME/Documents/Images/wallpapers" "$HOME/Pictures/wallpapers"