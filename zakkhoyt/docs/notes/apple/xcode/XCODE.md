# Xcode

## Hotkeys
* Wrap arguments: <kbd>ctrl</kbd> + <kbd>m</kbd> 
* Duplicate: <kbd>cmd</kbd> + <kbd>d</kbd>
* Expand all files/folders: Select dirs then, <kbd>opt</kbd> + <kbd>right</kbd> + <kbd>arrow</kbd>
* Collapse all files/folders: Select dirs then, <kbd>opt</kbd> + <kbd>left</kbd> + <kbd>arrow</kbd>

## Open without opening previous session


### Sticky Settings
```sh
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES
```

### Clicking Icon

* `opt` + `shift` + click on Xcode

### Command Line
```sh
open -a /Applications/Xcode.app/ --args -ApplePersistenceIgnoreState YES
open -a /Applications/Xcode.app $PROJECT --args -ApplePersistenceIgnoreState YES
```

### Scripting
```sh
# Remove contents of
~/Library/Autosave Information/
~/Library/Saved Application State/com.apple.dt.Xcode.savedState
```

## Binary tools
To list tools located in Xcode bundle

```sh
$ ls -1 /Applications/Xcode.app/Contents/Developer/usr/bin/
```
* `xcodebuild`: `/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild`
* `swift-build`: `/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build `

## Build Timeline
```sh
# Open main & assistant editors, syncs the other pane on click.
Editor -> Open Timeline
# Click in one pane, the other scrolls to item of interest. 
```

```sh
Navigate to Related Items -> Recent Build Timeline
```


## Asset Catalog


## plugins

https://digitalbunker.dev/editkit-pro/


## Bundle Identifiers
"Xcode automatically generates a bundle (and its identifier) for you to hold resources found in an SPM package using the following format: [package name]-[package target name]-resources."

`[package name]-[package target name]-resources`

[Reference](https://stackoverflow.com/questions/58000140/swift-package-manager-storyboard-bundle)


# Custom Behavior

Run a shells script on keystroke. [Article](https://medium.com/@damjandimovski/open-terminal-from-xcode-9e4c10f7ace1)

# Open terminal & load script
```sh
#! /bin/bash
open -a Terminal "$SRCROOT"
```

```sh
osascript -e 'tell app "Terminal"
    do script "echo hello"
end tell'
```

```sh
osascript -e 'tell app "Terminal" to do script "cd ~/somewhere &&
ls -al &&
git status -s && 
npm start"'
```


Shell scripts which have the extension `.command` and which are executable, can be double-clicked on to run inside a new Terminal window. The command open, as you probably know, is equivalent to double-clicking on a Finder object, so this procedure ends up running the commands in the script within a new Terminal window.
```sh
% cat /tmp/hello.command
#! /bin/sh -
say hello
% chmod +x /tmp/hello.command
% open /tmp/hello.command
```

```sh
#!/usr/bin/osascript

on run argv
   tell app "Terminal" 
   set AppleScript's text item delimiters to " "
        do script argv as string
        end tell
end run 
```


# ProcessInfo

```swift
extension ProcessInfo {
// We only want this to be used in debug builds
#if DEBUG
    /// When Xcode is launched from terminal that environment is captured by `ProcessInfo.processInfo.environment` (doesn't mutate)
    /// In my testing there:
    /// * Xcode launched from Terminal using `xed .`: `ProcessInfo.processInfo.environment` contained `175` key/value pairs
    /// * Xcode launched via icon click -> open project: `ProcessInfo.processInfo.environment` contained `48` key/value pairs
    ///
    /// If xcode was launched from command line:
    /// * `PWD` contains the value of `PWD` when Xcode was launched from command line
    /// * `OLDPWD` contains the value of previous `PWD` when Xcode was launched from command line
    public func d_logEnvironment() {
        logger.debug("**** **** **** **** Listing ProcessInfo.processInfo.environment")
        ProcessInfo.processInfo.environment.keys.sorted().enumerated().forEach { index, key in
            guard let value = ProcessInfo.processInfo.environment[key] else {
                logger.warning("ProcessInfo.processInfo.environment[\(key)] could not be found")
                return
            }
            logger.debug("#[\(index)] environment[\(key)]: \(value)")
        }
    }
    
    /// Logs all values present in `ProcessInfo.processInfo.arguments`
    ///
    /// Unlike `ProcessInfo.processInfo.environment` the number of values in`ProcessInfo.processInfo.arguments`
    /// seems to be the same regardless of how Xcode is launched.
    /// In my testing there:
    /// * Xcode launched from Terminal using `xed .`: `ProcessInfo.processInfo.arguments` contained `11` values
    /// * Xcode launched via icon click -> open project: `ProcessInfo.processInfo.arguments` contained `11` values
    public func d_logArguments() {
        logger.debug("**** **** **** **** Listing ProcessInfo.processInfo.arguments")
        ProcessInfo.processInfo.arguments.sorted().enumerated().forEach { index, argument in
            logger.debug("[\(index)]: \(argument)")
        }
    }
#endif
}

```
