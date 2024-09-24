# Ideas

## QuickAction
* [ ] convert macAddress to [QA Tools URL](https://qa-tools.hatchbaby.com/cs/product/34:AB:95:5D:2D:7E/logs)
* Format text as multiline (80 char lines)
* insert line numbers + line counts
* search in DDG 
* Define

# Tips
* Use `cmd`+`x` to cut and context menu to paste. 
  * This makes moving multiple actions much easier. 

# Comments

* `Comment`: This action lets you explain how part of a shortcut works.

# Debugging

`Shortcuts` has limited debugging support. There is no error catching/handling. 

* Use a `QuickLook Action` after an action to see a visual representation
* Use `View Content Graph` to cast the data to types (picking from a D3 type menu)

* `Append to Text File`: Adds the text passed as input to the end of the specified text file.
* `Speak Text`: Speaks the inputted text aloud.


You can run scripts to help with error handling:
* `Run Shell Script`
* `Run Shell Script over SSH`
* `Run Applescript`
* `Run Javascript for Mac Automation`


# Branching

* `If`: Tests if a condition is true, and if so, runs the actions inside. Otherwise, the actions under “Otherwise” are run.
* `Repeat`: Repeats the contained actions, running them the specified number of times.
* `Repeat with Each`: Takes a list of items as input, and runs the contained actions once for each item in the list.

# Return Early
asdf
* `Stop this Shortcut`: Stops execution of the current shortcut and dismisses the shortcut on screen. No more actions will be run after this action.
* `Stop and Output`: Stops execution of the current shortcut, and outputs content. This action is useful when:
  * Running a shortcut from another shortcut. The output will be used as the output of the Run Shortcut action.
  * Running a shortcut from Quick Actions in Finder on macOS. The output will be saved as a file alongside the files selected in Finder.
  * Running a shortcut from Services on macOS. The output will replace the selected text, if applicable.
  * Or, when running a shortcut from another location that supports output, like the command-line or the Shortcuts URL scheme.

# Reuse / DRY

* `Run Shortcut`: Runs another shortcut and returns the result

# Scripting Actions

## List
* `Choose from List`
* `Get Item from List`
* `List`

## Dictionary
* `Dictionary`
* `Get Dictionary from Input`
* `Get Dictionary Value`
* `Set Dictionary Value`

# I/O
* [Ask for Input](https://support.apple.com/en-gb/guide/shortcuts/apd68b5c9161/7.0/ios/17.0): Displays a dialog prompting the user to enter a piece of information.
* [Ask Each Time](https://support.apple.com/en-gb/guide/shortcuts/apd8b28e2166/7.0/ios/17.0): allows you to adjust the parameters of an action at runtime. Using the Ask Each Time variable, you can wait to decide how an action should operate until the shortcut is run.
* `Play Sound`: Plays the audio file passed as input, or a default notification sound if no audio file was passed.
* `Show Alert`: Displays an alert with a title, a message, and two buttons. If the user selects the OK button, the shortcut continues. The cancel button stops the shortcut.
* `Show Notification`: Displays a local notification.


## Import Question
* [Import Questions](https://support.apple.com/guide/shortcuts/add-import-questions-to-shared-shortcuts-apdf330fd3a0/ios)

When writing the shortcut, adding `Import Questions` isn't enough. you then need to click "customize shortcut" and answer the questions. 


# Find
* [Get](https://support.apple.com/en-gb/guide/shortcuts/apd3c845e881/7.0/ios/17.0)
* [Find](https://support.apple.com/en-gb/guide/shortcuts/apd3c845e881/7.0/ios/17.0)

# Shellscript
```sh
#!/bin/zsh

# -- begin shortcuts bootstrap

# About scripts for Shortcuts:
# * stdout is used for script output (stderr does not go out) (all lines)
# * stderr is used to show error to the user on non-0 exit (all lines)

# set -e

# Logs to stdout when IS_DEBUG
# In Shortcuts, all stdout is output from the shellscript action on 0 exit
unset -v IS_DEBUG
IS_DEBUG="true"
log_d() {
  if [[ -z "${IS_DEBUG}" ]]; then
    echo "DEBUG: $*"
  fi
}

# Writes to stderr. 
# In Shortcuts, all stderr is presented to the user on non-0 exit
log_stderr() {
  echo "\$*: $*" 1>&2 
}

if [[ -z "$1" ]]; then
  log_stderr "ERR: No text arguments received."
  exit 1
fi
input="$1"
log_d "input: $input"

# -- begin script work

echo "output (input): $input"

# Check for gnu-sed
# GSED_PATH=$(which gsed)
GSED_PATH=/opt/homebrew/bin/gsed
ls -1 "$GSED_PATH" > /dev/null 2>&1
RVAL=$?
if [[ $RVAL -ne 0 ]]; then
  log_stderr 'Required tool not found: gsed
To install: brew install gnu-sed'
  exit 1
else 
  log_d "Found gsed at: ${GSED_PATH}"
fi

# Convert input from words to HTML highlighted keyboard shortcuts
# ```sh
# $ echo "cmd + shift + l" | gsed -r 's|(\W+)| + |g' | gsed -r 's|(\w+)|<kbd>\1</kbd>|g' | tr '[:upper:]' '[:lower:]'
# <kbd>cmd</kbd> + <kbd>shift</kbd> + <kbd>l</kbd>
# ```
output=$(echo "$input" | "$GSED_PATH" -r 's|(\W+)| + |g' | "$GSED_PATH" -r 's|(\w+)|<kbd>\1</kbd>|g' | tr '[:upper:]' '[:lower:]')

# Output
log_d "output: $output"
echo "$output"
```



# References
* [Shortcuts User Guide](https://support.apple.com/en-gb/guide/shortcuts/welcome/7.0/ios)
* [Apple Docs](https://support.apple.com/guide/shortcuts-mac/APD8EFA49A70/7.0/mac/14.2)
* [Choose from List](https://support.apple.com/en-gb/guide/shortcuts/apd4dcacc115/7.0/ios/17.0#apd19a8dbc87)
* [Choose from Menu](https://support.apple.com/en-gb/guide/shortcuts/apdd7bf369da/7.0/ios/17.0)
