
# Language

* [wiki](https://en.wikipedia.org/wiki/AppleScript)
* Script files: `*.applescript`
* Compiled files: `*.scpt`


## VSCode Extensions
[AppleScript](https://marketplace.visualstudio.com/items?itemName=idleberg.applescript)
```sh
code --install-extension ~/Downloads/applescript-0.25.1.vsix
```


# References
* [Apple Fundamentals](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_fundamentals.html)
* [Commands Reference](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html)


## Comments

* [Comments](https://alvinalexander.com/blog/post/mac-os-x/applescript-use-comments/)

```applescript
# this is a comment

-- this is a comment

(* these
are
comments *)
```

## Debugging
* [Apple (debugging)](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_fundamentals.html#//apple_ref/doc/uid/TP40000983-CH218-SW20)
* [log](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html#//apple_ref/doc/uid/TP40000983-CH216-SW49)
* [logging](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_fundamentals.html#//apple_ref/doc/uid/TP40000983-CH218-SW17)
* [display_dialog](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html#//apple_ref/doc/uid/TP40000983-CH216-SW12)
* [working with errors](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_error_xmpls.html#//apple_ref/doc/uid/TP40000983-CH221-SW1)
* [automator](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/MakeaSystem-WideService.html)



# Running AppleScript from Terminal

```applescript
a.scpt:
on run argv
    return "hello, " & item 1 of argv & "."
end run
```
```sh
% osascript a.scpt world
    hello, world.
```

# Interacting with Users
* [Apple (Interacting with Users)](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/DisplayDialogsandAlerts.html)

## Log
```applescript
log currentWord
```

## Beeping
```applescript
beep 3 -- three beeps; a very important part of the script!
```

## Say
```applescript
say "I'm in the clientName handler. The client is " & currentClient
```

## Notification
```sh
notify_error() {
    osascript -e "display notification \"$*\" with title \"Error in Xcode Behavior\""
}
```

## Dialog
```applescript
display dialog "In factorial routine; x = " & (x as string)
```


## Alert
```applescript
set theAlertText to "An error has occurred."
set theAlertMessage to "The amount of available free space is dangerously low. Would you like to continue?"
display alert theAlertText message theAlertMessage as critical buttons {"Don't Continue", "Continue"} default button "Continue" cancel button "Don't Continue"
```

## Choose from List
```applescript


    set theFruitChoices to {"Apple", "Banana", "Orange"}
    set theFavoriteFruit to choose from list theFruitChoices with prompt "Select your favorite fruit:" default items {"Apple"}
    theFavoriteFruit
    --> Result: {"Apple"}
```





## References
* `man osascript`
* [techradar.com](https://www.techradar.com/how-to/computing/apple/terminal-101-running-applescripts-from-the-terminal-1305736)



```sh
osascript -e 'tell application "Terminal" to quit'

osascript -e 'tell app "Finder" to make new Finder window'

osascript -e "set volume 0"
```

```sh
#!/usr/bin/osascript
osascript /example/path/to/AppleScript.scpt
```

# Launching Terminal with AppleScript
```sh
osascript -e 'tell app "Terminal"
    do script "echo hello"
end tell'
```


# Examples




## Inspecting properties of an object

Document in this case
```applescript
tell application "Xcode" to get properties of document 1 whose name ends with (word -1 of (get name of  window 1))

class:text document, 
modified:false, 
name:HexString+Primitives.swift, 
notifies when closing:true, 
text://  HexString+Primitives.swift...,
file:file Macintosh HD:Users:zakkhoyt:Library:Developer:Xcode:DerivedData:HatchTerminal-cjeenqfyvaitvxemximkxngrznzt:SourcePackages:checkouts:VWWUtility:Sources:BaseUtility:HexString:HexString+Primitives.swift, 
path:/Users/zakkhoyt/Library/Developer/Xcode/DerivedData/HatchTerminal-cjeenqfyvaitvxemximkxngrznzt/SourcePackages/checkouts/VWWUtility/Sources/BaseUtility/HexString/HexString+Primitives.swift, 
selected character range:443, 442, 
selected paragraph range:21, 21

-- To just get file path
tell application "Xcode" to get path of (get properties of document 1 whose name ends with (word -1 of (get name of   window 1)))
```

Get path of document file
```sh
$ osascript shell/applescript/xcode_active_file.applescript
/Users/zakkhoyt/Library/Developer/Xcode/DerivedData/HatchTerminal-cjeenqfyvaitvxemximkxngrznzt/SourcePackages/checkouts/VWWUtility/Sources/BaseUtility/HexString/HexString+Primitives.swift
```

```sh
osascript -e 'tell application "Xcode" to get path of (get properties of document 1 whose name ends with (word -1 of (get name of window 1)))'

```

```sh
osascript -e 'tell app "Terminal" to do script "say 'launched'"'
```




```sh
# Run some commands
# Important: The script must be wrapped in quotes (not optional)
osascript -e "tell app \"Terminal\" to do script \"cd ${XCODE_DIR}\nsay 'code'\nls -al\""

# Or long
osascript -e "tell app \"Terminal\" 
    do script \"${LOG_COMMAND}\"
    activate
end tell"
```

```sh
# Bring terminal to front ("reopen" if no windows)
osascript -e "tell app \"Terminal\" to activate"
```

```sh
# Bring running application to front 
osascript -e "tell application \"System Events\" to tell application process \"Terminal\"
    set frontmost to true
end tell"
```



```applescript
tell application "Music" to get properties of file track 1

class:application, 
name:Music, 
player state:paused, 
version:1.5, 
frontmost:false, 
sound volume:83, 
mute:false, 
shuffle enabled:false, 
shuffle mode:songs, 
song repeat:off, 
visuals enabled:false, 
full screen:true, 
EQ enabled:false, 
fixed indexing:false, 
player position:8.567000389099, 
converting:false, 
AirPlay enabled:false, 
current AirPlay devices:AirPlay device id 33
```


# Inspecting System Settings preference panes
See [VWWUtility](https://github.com/zakkhoyt/VWWUtility/tree/main/Sources/BaseUtility/SystemSettings/README.md) for a detailed overview
```applescript
-- First: open System Settings.app and navigate the a pane/setting. 
-- Then: run this script to find out name (Pane ID) and any anchors.
on mapAnchors(prefix, anchors)
	set newList to {}
	repeat with i from 1 to count of anchors
		set anchor to item i of anchors
		set newAnchor to "case " & anchor & " = " & "\"" & prefix & "&" & anchor & "\""
		set end of newList to newAnchor
	end repeat
	return newList
end mapAnchors

tell application "System Settings"
	set AppleScript's text item delimiters to ", "
	set CurrentPane to the id of the current pane
	display dialog CurrentPane
	-- log (CurrentPane)
	-- do shell script "echo The value: " & CurrentPane
	get the name of every anchor of pane id CurrentPane
	set CurrentAnchors to get the name of every anchor of pane id CurrentPane
	set prefix to "x-apple.systempreferences:" & CurrentPane
	set CurrentAnchors to my mapAnchors(prefix, CurrentAnchors)
	set the clipboard to prefix & "
" & CurrentAnchors
	display dialog "Current Pane ID: " & CurrentPane & return & return & "Pane ID has been copied to the clipboard." & return & return & "Current Anchors: " & return & (CurrentAnchors as string)
end tell
```



## Errors

```applescript
on SumIntegerList from itemList
    try
        -- Initialize return value.
        set integerSum to 0
        -- Before doing sum, check that all items in list are integers.
        if ((count items in itemList) is not equal to ¬¨
            (count integers in itemList)) then
            -- If all items aren‚Äôt integers, signal an error.
            error number 750
        end if
        -- Use a repeat statement to sum the integers in the list.
        repeat with currentItem in itemList
            set integerSum to integerSum + currentItem
        end repeat
        return integerSum -- Successful completion of handler.
    on error errStr number errorNumber
        -- If our own error number, warn about bad data.
        if the errorNumber is equal to 750 then
            -- display dialog "All items in the list must be integers."
            log "All items in the list must be integers."
            error number 750
            return integerSum -- Return the default value (0).
        else
            -- An unknown error occurred. Resignal, so the caller
            -- can handle it, or AppleScript can display the number.
            error errStr number errorNumber
        end if
    end try
end SumIntegerList

set sumList to {750, 10}
set listTotal to SumIntegerList from sumList

try
    set sumList to {1, 3, 5, "A"}
    set listTotal to SumIntegerList from sumList
on error errMsg number errorNumber
    display dialog "An unknown error occurred:  " & errorNumber as text
end try

```

# Inspecting Built in AppleScript Support

[Reference Article](https://apple.stackexchange.com/questions/339088/list-of-all-applescript-commands-for-terminal-application)
* Open Script Editor
* File -> New
* File -> Open Dictionary (browse to app you have in mind)
* Browse the API

Also 3rd party tool, [Script Debugger](https://latenightsw.com/sd8/download/)