#!/bin/bash

a=$(echo "abc" | grep)




mkdir -p "$HOME/code"

mkdir -p "$HOME/code/repositories"

mkdir -p "$HOME/code/repositories"

mkdir -p "$HOME/code/repositories/learning"

mkdir -p "$HOME/code/repositories/hatch/"
mkdir -p "$HOME/code/repositories/hatch/hatch_mobile"
mkdir -p "$HOME/code/repositories/hatch/hatch_sleep"

mkdir -p "$HOME/code/repositories/vww/certificates"
mkdir -p "$HOME/code/repositories/vww/github"
mkdir -p "$HOME/code/repositories/vww/gitlab"

mkdir -p "$HOME/code/CodeSnippets"

# Symbolic links
ln -s "$HOME/Library/Developer/Xcode/DerivedData" "$HOME/code/DerivedData"
ln -s "$HOME/Library/MobileDevice/Provisioning Profiles" "$HOME/code/ProvisioningProfiles"
ln -s "$HOME/Library/Developer/Xcode/UserData/CodeSnippets" "$HOME/code/CodeSnippets/xcode"
ln -s "$HOME/Library/Application Support/Code/User/snippets" "$HOME/code/CodeSnippets/vscode"
ln -s "$HOME/Documents/HatchDocs/books" "$HOME/code/books"
ln -s "$HOME/Library/Application Support/Instruments" "$HOME/code/Instruments"

# Automator
ln -s "$HOME/Library/Services" "$HOME/code/automator_user"
ln -s "/System/Library/Automator" "$HOME/code/automator_system"



