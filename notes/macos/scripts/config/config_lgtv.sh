#!/bin/bash

SCRIPT_DIR=$(realpath "$(dirname "$0")")
echo "SCRIPT_DIR: $SCRIPT_DIR"

brew install python
brew install jq
brew install --cask hammerspoon
# Enable accessiblity in Hammerspoon config menu. 


mkdir -p "$HOME/opt";
/opt/homebrew/bin/python3 -m venv "$HOME/opt/lgtv";
# shellcheck disable=SC2164
cd "$HOME/opt/lgtv";
# shellcheck disable=SC1091
source "$SCRIPT_DIR/bin/activate";
pip install git+https://github.com/klattimer/LGWebOSRemote;

# Will print IP of TVs found
# lgtv scan ssl
lgtv scan ssl | jq '.list[] | select(.address == "192.168.4.FF")' | jq -r '.address'
lgtv scan ssl | jq '.list[].address'

LGTV_IP=$(lgtv scan ssl | grep '"result":' | jq -r '.list[].address')
lgtv auth "$LGTV_IP" "LGC1" 


