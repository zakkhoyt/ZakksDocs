
# Table of Contents
- [Table of Contents](#table-of-contents)
- [About](#about)
- [Running a Swift file as a Shell Script](#running-a-swift-file-as-a-shell-script)
  - [Create a Swift file](#create-a-swift-file)
  - [Add Shebang](#add-shebang)
  - [Add Executable Permissions](#add-executable-permissions)
  - [Execute Script in Terminal.app](#execute-script-in-terminalapp)
  - [Execute Script in VSCode](#execute-script-in-vscode)
  - [Execute Script in Xcode](#execute-script-in-xcode)
- [Debugging a Swift Script](#debugging-a-swift-script)
  - [Create Executable Package](#create-executable-package)
  - [Move your Script](#move-your-script)
  - [Change the script name](#change-the-script-name)
  - [Configure (Add Shebang)](#configure-add-shebang)
  - [Configure (Add Executable Permissions)](#configure-add-executable-permissions)
  - [Debugging on Command Line](#debugging-on-command-line)
  - [Debugging in VSCode](#debugging-in-vscode)
    - [Breakpoints](#breakpoints)
    - [Injecting Arguments](#injecting-arguments)
    - [Injecting Environment](#injecting-environment)
  - [Debugging in Xcode](#debugging-in-xcode)
    - [Breakpoints](#breakpoints-1)
    - [Injecting Arguments](#injecting-arguments-1)
    - [Injecting Environment](#injecting-environment-1)
- [Compile a Swift Script to Binary](#compile-a-swift-script-to-binary)
  - [Inspecting a compiled Swift Script Binary](#inspecting-a-compiled-swift-script-binary)
- [Swift Script as Run Script Phase in Xcode](#swift-script-as-run-script-phase-in-xcode)
  - [Env Vars](#env-vars)
- [Importing 3rd Party Packages in a Swift Script](#importing-3rd-party-packages-in-a-swift-script)
  - [swift-sh](#swift-sh)


# About
This document is focused on running a single Swift file a shell script within a shell environment like `bash` or `zshell`. 

This opens Swift as a scripting tool on the command line, but does bring some limitations. For example the Swift code must be a single file and cannot easily import 3rd party packages. 

Swift scripts are going to be much slower than their bash counterparts, so there is a need to balance speed vs the right tool for the job. 



# Running a Swift file as a Shell Script
* Here is a good [reference article](https://rderik.com/blog/using-swift-for-scripting/#our-first-swift-script) on the subject. 


## Create a Swift file
First create new file `MyScript.swift` with the following contents:
```swift
import Foundation
print("Hello world (from Swift)")
```

## Add Shebang

Add a shebang as the first line in the script. 
```swift
#!/usr/bin/env -S swift
```
Note: *Adding a shebang used to cause problems while running from Xcode, but this no longer seems to be the case.*

Question: Why use `#!/usr/bin/env -S swift`, instead of  `#!/usr/bin/swift`?

The `man env` page has terrific information about this. TLDR is `env` will treat everything after `-S` as a single string input then pass it in tokens to what ever binary is specified. More stable/compaible, esp if you add more params.


## Add Executable Permissions
Make your script executable just like you would for a shell script:
```sh
chmod +x ./MyScript.swift
```

## Execute Script in Terminal.app
Using command line, navigate to your script's directory
```sh
./MyScript.swift
# Hello world (from Swift)
```


## Execute Script in VSCode
To run a Swift script in VSCode without any sort of debugging:
* On command line, navigate to the script dir: `code MyScript.swift`
* In VSCode Command Pallette (`cmd`+`shift`+`P`) -> `Swift: Run Swift Script:`
* Or, right click in the script: `Swift` -> `Run Swift Script`

## Execute Script in Xcode
To my knowledge Xcode cannot be used to run a standalone Swift file as a script. It requires some sort of xcodeproj, xcworkspace, or swift package which all allow debugging, code completion, and more (covered below).


# Debugging a Swift Script

Now that you have a working Swift script you'll want to be able to debug. This is possible to do with several tools like Xcode, VSCode, and Terminal.app w/lldb. 

## Create Executable Package
The easiest way to allow debug support is to wrap your script in a Swift Package (executable type for macOS). Let's do that now. 

```sh
mkdir MySwiftScript
cd MySwiftScript
swift package init --type executable
```

Optional: Limit your package to macOS. Add the following to Package.swift
```swift
`platforms: [.macOS(.v14)],`
```

## Move your Script

To follow file/folder convention for the vast majority of Swift packages (the library type), we'll need to move script into new subdirectory under `Sources/`
```sh
# create new subdir
mkdir -p Sources/MySwiftScript
# move our script into the new subdir
mv Sources/main.swift Sources/MySwiftScript/main.swift
```

## Change the script name
TODO: @zakkhoyt - can we rename our script from main.swift to arbitrary? How does this impact VScode, Xcode? For now do not rename. 


## Configure (Add Shebang)

Add a shebang as the first line in the script. 
```swift
#!/usr/bin/env -S swift
```
Note: *Adding a shebang used to cause problems while running from Xcode, but this no longer seems to be the case.*

Question: Why use `#!/usr/bin/env -S swift`, instead of  `#!/usr/bin/swift`?

The `man env` page has terrific information about this. TLDR is `env` will treat everything after `-S` as a single string input then pass it in tokens to what ever binary is specified. More stable/compaible, esp if you add more params.


## Configure (Add Executable Permissions)
Make your script executable just like you would for a shell script:
```sh
chmod +x Sources/main.swift
```


## Debugging on Command Line

Now run the script
```sh
Sources/main.swift
```
or
```sh
cd Sources
./main.swift
```


## Debugging in VSCode

TODO: zakkhoyt - List recommended VSCode extensions

Open your Swift Package in VSCode:
```sh
cd MySwiftScript
code .
```

When you open a Swift Package folder in VSCode, two `lldb` launch configurations for you. A debug variant and a release variant. Select the debug variant:
* Switch to the `Run and Debug` panel: `cmd`+`shift`+`D`
* At the top of the panel, find a drop list. Select the debug variant. 
* Click the play button to run a debugging session.

This will run your script in VSCode's debugging environment. Observer the following locations in VSCode:
* The `Problems` panel (`cmd`+`shift`+`M`) will list any issues found resolving/compiling/launching
* The `Debug Console` panel (`cmd`+`shift`+`Y`) will give details on what's being executed
* The `Temrinal` (`cmd`+`T`, `cmd`+`T`) -> `Debug MySwiftScript` will show your stdout, stderr, and stdin.
  * You should see your `Hello World` output

### Breakpoints
VSCode supports breakpoints as it is simply using `lldb` under the hood. To add a breakpoint:
* Navigate to `Sources/main.swift`
* Add a breakpoint to `print("Hello, world!")` by clicking in the gutter (like `Xcode`).
* Run another debug session. Execution will hault at your breakpoint. 

### Injecting Arguments
VSCode can launch your script with predefined Arguments. 
* Navigate to `.vscode/launch.json`. This is where those two `lldb` launch configurations are defined. 
* Under the debug variant, locate `"args": [],` 
* Add your arguments here as valid JSON string array. EX:
```json
"args": [
    "--red", "Here is some red text.", "--default", " And some default text."
],
```
* Run another debug session. Execution will hault at your breakpoint. Verify your Arguments in the `Run and Debug` pane under `variables` -> `global` -> `arguments`
* Use `lldb` to print the arguments. Navigate to the `Debug Console` panel (`cmd`+`shift`+`Y`). Then enter:
```sh
po CommandLine.arguments
po ProcessInfo.processInfo.arguments
```

### Injecting Environment
VSCode can launch your script in different environments (see `ProcessInfo.processInfo.environment`). Your script will be passed the environment that is inherited from terminal, but you can further modify key/value pairs in your build configuration.
* Navigate to `.vscode/launch.json`. This is where those two `lldb` launch configurations are defined. 
* Under the debug variant of your build configuration, append (if not present) `"env": {},` 
* Add your environment key/value pairs here as valid JSON dictionary. EX:
```json
"env": {
    "MY_KEY": "MY_VALUE"
},
```

* Run another debug session. Execution will hault at your breakpoint. Verify that your custom key/value pair exists in the `environment`. Unlike `arguments`, the `Run and Debug` pane does not display `environment` so we will need to use other means.
* Use `lldb` to print the arguments. Navigate to the `Debug Console` panel (`cmd`+`shift`+`Y`). Then enter:
```sh
# Print number of key/value pairs in environment
po ProcessInfo.processInfo.environment.count
# print all environment key/value pairs
po ProcessInfo.processInfo.environment
# Filter environment key/value pairs down to "MY_KEY" only
po ProcessInfo.processInfo.environment.filter { $0.key == "MY_KEY" }
```


## Debugging in Xcode

Open your Swift Package in Xcode:
```sh
cd MySwiftScript
xed .
```

<!-- When you open a Swift Package folder in VSCode, two `lldb` launch configurations for you. A debug variant and a release variant. Select the debug variant:
* Switch to the `Run and Debug` panel: `cmd`+`shift`+`D`
* At the top of the panel, find a drop list. Select the debug variant. 
* Click the play button to run a debugging session. -->

Xcode will offer several destinations from the drop menu even if your package is narrowed to macOS only. 
* Select the destination: `My Mac`
* To output to `Terminal.app` instead of Xcode's console: Open Scheme Settings (`cmd`+`shift`+`,`) then select `Run` (left menu) -> `Options` (top tabs) -> `Console` -> `Terminal`
* Begin a debugging session: `cmd`+`R`
* A terminal window will open with some xcode business output then eventually the output from your script


```json
test
```

### Breakpoints
* Navigate to `Sources/main.swift`
* Add a breakpoint to `print("Hello, world!")` by clicking in the gutter.
* Run another debug session. Execution will hault at your breakpoint.

### Injecting Arguments
Xcode can launch your script with predefined Arguments. 
* Open Scheme Settings (`cmd`+`shift`+`,`) then select `Run` (left menu) -> `Arguments` (top tabs) -> `Arguments passed on Launch`
* Add your arguments here as valid plist string array. Note it is valid to add many strings to one entry, or you can do one per line. EX:
```json
"--red" "Here is some red text." "--default" " And some default text."
```
* Run another debug session. Execution will hault at your breakpoint. Verify your Arguments in the `Variables View` under `arguments`
* Use `lldb` to print the arguments: 
```sh
po CommandLine.arguments
```

### Injecting Environment
Xcode can launch your script in different environments (see `ProcessInfo.processInfo.environment`). Your script will be passed the environment that is inherited from terminal, but you can further modify key/value pairs in your build configuration.
* Open Scheme Settings (`cmd`+`shift`+`,`) then select `Run` (left menu) -> `Environment` (top tabs) -> `Environment Variables`
* Add your environment key/value pairs here as valid Plist dictionary. EX:
```json
"env": {
    "MY_KEY": "MY_VALUE"
},
```

* Run another debug session. Execution will hault at your breakpoint. Verify that your custom key/value pair exists in the `environment`. Unlike `arguments`, the `Variables View`  does not display `environment` so we will need to use other means.
* Use `lldb` to print the your environment. Navigate to the `Debug Console` panel (`cmd`+`shift`+`Y`). Then enter:
```sh
# Print number of key/value pairs in environment
po ProcessInfo.processInfo.environment.count
# print all environment key/value pairs
po ProcessInfo.processInfo.environment
# Filter environment key/value pairs down to "MY_KEY" only
po ProcessInfo.processInfo.environment.filter { $0.key == "MY_KEY" }
```

# Compile a Swift Script to Binary

* [kodeco](https://www.kodeco.com/25816315-using-swift-scripts-with-xcode)

```sh
xcrun swiftc -parse-as-library File.swift

# Compiled for mac with a new binary name
xcrun --sdk macosx swiftc -parse-as-library HelloXcode.swift -o CompiledScript
```


Compile multiple scripts in one go. 
``````sh
xcrun --sdk macosx swiftc \
  -parse-as-library $SCRIPT_INPUT_FILE_0 Scripts/Shell.swift \
  Scripts/OverlayLabel.swift Scripts/ImageOverlay.swift -o CompiledScript ./CompiledScript
``````

## Inspecting a compiled Swift Script Binary

You can see what has been packaged into your binary (release configuration too). Locate your binary then use the `nm` tool

```sh
# list all symbol names (raw)
nm ./echo_pretty 
nm ./echo_pretty | wc -l

# only global symbols, just names, Add path name. 
nm ./echo_pretty -gjA
```


# Swift Script as Run Script Phase in Xcode

## Env Vars 
Access environment properties in Run Script (checkbox there)
[Apple Docs](https://help.apple.com/xcode/mac/11.4/index.html?localePath=en.lproj#/itcaec37c2a6)

```sh
# In Xcode project settings: `RunScript -> Input File` the files are accessed as env vars with index suffix
$SCRIPT_INPUT_FILE_0
$SCRIPT_INPUT_FILE_1
```


# Importing 3rd Party Packages in a Swift Script

When using Swift in a scripting environment, it is not normally possible to import 3rd party packages. However there are some 3rd party tools available to facilitate just that. 


## swift-sh
[swift-sh](https://github.com/mxcl/swift-sh) is IMO the best of the currently available tools. 

* Install using homebrew
* Modify your `shebang` 
* Add your `import` statements along with a trailing comment to direct `swift-sh` where to find the source code. 
* Run your script on command line as normal. 
* *Note*: `swift-sh` these modifications do not interfere with normal Swift compilation (you can mix the Scripting syntax into a Package environment).

Example syntax:
```swift
#!/usr/bin/env -S swift-sh
import ArgumentParser // git@github.com:apple/swift-argument-parser ~> 1.3
// Use arg parser as normal
```

Example header:
```swift
#!/usr/bin/env -S swift-sh
/// When using Swift in a scripting environment, it is not normally possible to import
/// 3rd party packages. That's where [swift-sh](https://github.com/mxcl/swift-sh)
/// comes in. Notice the shebang above and the comments on come of the `import` statements
/// below. Together these trigger `swift-sh` to download/build/cache a copy when run as a script.
/// Also this does not interfere if you choose to compile this swift code to binary.
/// Try `swift-sh --clean-cache` if you find yourself in a jam
```
