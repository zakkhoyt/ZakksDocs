#!/bin/bash


# export FF_PROFILE_DIR=$(pbpaste)"
# FF_PROFILE_DIR="$(dirname "$(ls -1tr "$HOME/Library/Application Support/Firefox/Profiles/" | tail -n 1)")"
# FF_ALL_PROFILES_DIR="$HOME/Library/Application Support/Firefox/Profiles/"


# FF_PROFILE_DIR="$HOME/Library/Application Support/Firefox/Profiles/$(ls -1tr "$HOME/Library/Application Support/Firefox/Profiles/" | tail -n 1)"
# FF_PROFILE_DIR=$(ls -1tr "$HOME/Library/Application Support/Firefox/Profiles/" | tail -n 1)
FF_PROFILE_DIR="$HOME/Library/Application Support/Firefox/Profiles/$(ls -1tr "$HOME/Library/Application Support/Firefox/Profiles/" | tail -n 1)"

# if [[ ]]; then
#   ls "$FF_PROFILE_DIR"
# fi

ls -1 "$FF_PROFILE_DIR" > /dev/null 2>&1
RVAL=$?
if [[ $RVAL -ne 0 ]]; then
  echo "Failed to locate your Firefox profile directory. Here is how to locate it manually:" 1>&2 
  echo "* Open Firefox" 1>&2 
  echo "* Help -> More Troubleshooting Information" 1>&2 
  echo "* Find 'Profile Folder'" 1>&2 
  echo "    * It should look something like this: '$HOME/Library/Application Support/Firefox/Profiles/abcd1234.default-release'" 1>&2 
  echo "* Copy the filepath then paste it as the value of FF_PROFILE_DIR above" 1>&2 
  echo "* Re-run this script" 1>&2 
  exit 1
else 
  echo "Validated FF_PROFILE_DIR is an existing directory"  1>&2 
fi

echo "FF_PROFILE_DIR: ${FF_PROFILE_DIR}"

FF_CHROME_DIR="${FF_PROFILE_DIR}/chrome"
echo "FF_CHROME_DIR: ${FF_CHROME_DIR}"

FF_USER_CHROME="${FF_CHROME_DIR}/userChrome__.css"
echo "FF_USER_CHROME: ${FF_USER_CHROME}"


# Make dir
mkdir -p "${FF_CHROME_DIR}"

# Populate FF_USER_CHROME
echo '/* Must set toolkit.legacyUserProfileCustomizations.stylesheets= true in about:config */

/* Does not hide the stoplight buttons */
/* #tabbrowser-tabs { visibility: collapse !important; } */

/* Hides the stoplight buttons */
#TabsToolbar { visibility: collapse !important; }

/* Hides the label above the side tabs */
#sidebar-header {
  display: none;
}' > "${FF_USER_CHROME}"


echo -e "\nDid write the following content to: " "\x1B[96m\x1B[4m" "${FF_USER_CHROME}\n" "\n\x1B[0m" "\x1B[93m\x1B[1m"  1>&2
# Print file to stdout
cat "${FF_USER_CHROME}"
echo -e "\n\x1B[0mPlease restart Firefox\n" 1>&2


