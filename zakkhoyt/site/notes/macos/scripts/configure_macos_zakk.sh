#!/bin/bash



SCRIPT_NAME=$(basename "$0")
echo "SCRIPT_NAME: $SCRIPT_NAME"

SCRIPT_DIR=$(realpath "$(dirname "$0")")
echo "SCRIPT_DIR: $SCRIPT_DIR"


export VISUAL="code --wait"
echo "VISUAL: $VISUAL"


# TODO: zakkhoyt. Test/prove each script in config dir
"$SCRIPT_DIR/config/config_defaults.sh"
"$SCRIPT_DIR/config/config_dirs_code.sh"

