
## CLI
* Install CLI from [here](https://github.com/RobotsAndPencils/xcodes/releases/tag/1.3.0) 
* Put the binary in your PATH  (make sure it's ahead of `xcodes.app`, if installed)
* For faster `xcodes` downloads, `brew install aria2`
* sign in to xcodes
  * ???


```sh

#xcodes list

# latest non-beta/rc
LATEST=$(xcodes list | grep -vi "beta\|candidate" | tail -n 1)

# Check if already installed. 
echo "$LATEST" | grep -vi "installed"
RVAL=$?
if [[ $RVAL -ne 0 ]]; then
  logStdErr "Xcode $LATEST is already installed"
  exit 0
fi


xcodes signout # Ensure we are signed out (to use fastlane auth)
xcodes install --use-fastlane-auth "$LATEST" 
# authenticate
xcodes select "$LATEST" 
```