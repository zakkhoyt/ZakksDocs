# References
* [Apple SPM documentation (GitHub)](https://github.com/apple/swift-package-manager/blob/main/Documentation)

# Editing a Package
* [link](https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md#editing-a-package)

```sh
# This will create a branch called bugFix from the currently resolved version and put the dependency Foo in the Packages/ directory.
swift package edit <package name> --branch <branch name>>
# The command to attach (or create) a local checkout is:
swift package edit <package name> --path <path/to/dependency>
```

```sh
# This command fails if there are uncommitted changes or changes which are not pushed to the remote repository
swift package unedit <package name>
# Force like so:
swift package unedit <package name> --force
```



# Create a package on command line

```swift
// Create a library type. Infert name from pwd. 
swift package init
// ├── .build
// │  ├── artifacts
// │  ├── checkouts
// │  ├── repositories
// │  └── workspace-state.json
// ├── .gitignore
// ├── Package.swift
// ├── Sources
// │  └── .sandbox
// │     └── _sandbox.swift
// └── Tests
//    └── .sandboxTests
//       └── _sandboxTests.swift
```

```swift
// Specify name. Make a cmd tool instead of a library
swift package init --name dynamicMemberExperiment --type tool 

```



```sh
# https://github.com/realm/SwiftLint/releases
# Realm/SwiftLint@0.52.2
#
# grep "Realm/SwiftLint" Mintfile | sed -E "s/(.*@)()//g"
#
# Search in all Swift Packages for SwiftLint
\u{001B}[0;31m
grep "Realm/SwiftLint@" Mintfile | cut -d "@" -f 2 | xargs -I {} echo -n "{}" | tee >(pbcopy);
grep "Realm/SwiftLint@" Mintfile | cut -d "@" -f 2 | xargs -I {} echo -n "{}" | tee >(pbcopy) | xargs -I {} echo "Current SwiftLint version: {}";
echo "":
fastlane/scripts/packages/iterate_swift_package.sh . list | \
  xargs -I {} echo {}"/Package.swift" | \
  xargs -I {} grep -r "github.com/realm/SwiftLint" {} 2> /dev/null;


# https://github.com/nicklockwood/SwiftFormat/releases
# nicklockwood/SwiftFormat@0.51.10
#
# grep "nicklockwood/SwiftFormat" Mintfile | sed -E "s/(.*@)()//g"
#
# Search in all Swift Packages for SwiftFormat
grep "nicklockwood/SwiftFormat@" Mintfile | cut -d "@" -f 2 | xargs -I {} echo -n "{}" | tee >(pbcopy);
echo "";
fastlane/scripts/packages/iterate_swift_package.sh . list | \
  xargs -I {} echo {}"/Package.swift" | \
  xargs -I {} grep -r "github.com/nicklockwood/SwiftFormat" {} 2> /dev/null

```
# Command Line


## Target
List values for `-target`
[link](https://forums.swift.org/t/use-swiftpm-to-build-ios-target/25436/28)
```sh
$(xcode-select -p)/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/SDKSettings.json
```

[Reference](https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md#testing)


## Build (mac)
```sh
swift build --product HatchTerminalApp 
swift build --product WaveSynthKitTestApp 

swift build -c debug --product HatchTerminalApp 
```


swift package resolve \
  --sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.2

## Resolve (iOS)
```sh
# Resolve
swift package resolve \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
  -Xswiftc --platform \
  -Xswiftc ios 
```

## Build (iOS argument prep & tools)

Finding the right params can be a challenge. Here are some helpful tools and tips


```sh
# Shows ${PLATFORM_SDK}${OS_VERSION} for all platforms
$ xcodebuild -showsdks
	iOS 17.5                      	-sdk iphoneos17.5
	iOS Simulator - iOS 17.5          	-sdk iphonesimulator17.5
	macOS 14.5                    	-sdk macosx14.5

# Feed is a PLATFORM_SDK
# appletvos appletvsimulator driverkit iphoneos iphonesimulator macosx watchos watchsimulator xros xrsimulator
$ xcrun --sdk $PLATFORM_SDK --show-sdk-path
/Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk

$ xcode-select -p
/Applications/Xcode-15.4.0.app/Contents/Developer

# Prints current target/triple
$ swiftc -print-target-info # defaults to macosx
    "triple": "arm64-apple-macosx15.0",
    "unversionedTriple": "arm64-apple-macosx",
    "moduleTriple": "arm64-apple-macos",
$ swiftc -target arm64-apple-ios17.5 -print-target-info
# 
# Prints info about xcode project and settings
$ xcodebuild -list

# Get scheme names
$ xcodebuild -list

# Retain scheme name and enter below
$ xcodebuild -scheme HatchServiceAppStateUserDefaults -destination 'platform=iOS Simulator,name=iPhone 14' test
```


### Shell

For a working copy of this script, see: 
`/Users/zakkhoyt/code/repositories/hatch/hatch_sleep/scripts/shell/swift/swift_args.sh`
```sh
#!/bin/bash

DEPLOYMENT_TARGET="16.0"
if [[ $1 == "--deployment" ]]; then
    DEPLOYMENT_TARGET="$2"
    shift
    shift
fi

SP_SUBCOMMAND=$1

$APPLE="apple"
$ARCHITECTURE="arm64" # arm64 arm64_32 arm64e armv7k i386 x86_64
$PLATFORM_SDK="iphoneos" # appletvos appletvsimulator driverkit iphoneos iphonesimulator macosx watchos watchsimulator xros xrsimulator
$PLATFORM_NAME="ios" # driverkit (??) ios macosx tvos watchos xros

# $PLATFORM_SDK, $PLATFORM_NAME 
# appletvos, tvos
# appletvsimulator, tvos
# driverkit, driverkit (??)
# iphoneos, ios
# iphonesimulator, ios
# macosx, macosx
# watchos, watchos
# watchsimulator, watchos
# xros, xros
# xrsimulator, xros

# TARGET="arm64-apple-ios$DEPLOYMENT"
# arm64-apple-ios17.5
# arm64-apple-macosx15.0
TARGET="${ARCHITECTURE}-apple-${PLATFORM}${DEPLOYMENT_TARGET}"

SDK_PATH="$(xcrun --sdk $PLATFORM_SDK --show-sdk-path)"
# /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk


echo "TARGET: ${TARGET}"



# $ swift build \
#   --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
#   -Xswiftc -target \
#   -Xswiftc arm64-apple-ios17.5

# -Xswiftc is are swiftc arguments (swiftc --helP)
# swift "$SP_SUBCOMMAND" \
#   --arch "$ARCHITECTURE" \
#   -Xswiftc -sdk print("-Xswiftc -target \(target)")P"$SDK" \
#   -Xswiftc -target -Xswiftc "$TARGET" \
#   --scratch-path "./.build/$TARGET" \
#   "$@"

# Only use this if SP_SUBCOMMAND == 'build'
BUILD_DIR="--scratch-path \"./.build/$TARGET\""

swift "$SP_SUBCOMMAND" \
  --sdk "${SDK_PATH}" \
  --arch "$ARCHITECTURE" \
  -Xswiftc -target -Xswiftc "$TARGET" \
  "$@"
```

## Building (iOS)


Works for VWWUtility SPM
```sh
$ swift build \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
```


```sh
swift build \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
  -Xswiftc --platform \
  -Xswiftc ios \
  --product WaveSynthKitTestApp 


swift build \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
  -Xswiftc --platform \
  -Xswiftc ios \
  --product WaveSynthKitTestApp 


  
swift build \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
  --product zing
  -Xswiftc --platform \
  -Xswiftc ios \
```


```sh
swift build -v \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios17.5 \
  -Xswiftc "-sdk" \
  -Xswiftc "$(xcrun --sdk iphonesimulator --show-sdk-path)" 
```

```sh
swift build -v \
  --sdk "$(xcrun --sdk iphonesimulator --show-sdk-path)" \
  -Xswiftc -target \
  -Xswiftc spm6 \


# swift build -v \
#     -Xswiftc "-sdk" \
#     -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`" \
#     -Xswiftc "-target" \
#     -Xswiftc "x86_64-apple-ios13.0-simulator"
swift build --verbose \          
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk \
  --target arm64-apple-ios17.5

swift package resolve --verbose \
  --sdk /Applications/Xcode-15.4.0.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk
```





## Test (iOS)

```sh
swift test --list-tests

swift test list \
  --sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS16.4.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios16.4 \

swift test \
  --sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS16.4.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios16.4

swift build \
  --sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS16.4.sdk \
  -Xswiftc -target \
  -Xswiftc arm64-apple-ios16.4 \
  --build-tests
  --product HatchServiceAppStateUserDefaults \
  
```





# Tests on command line

```
# *  Executing task: 
swift package resolve \
--sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.0.sdk \
-Xswiftc -target \
-Xswiftc arm64-apple-ios17.0 

warning: 'argumentkit': ld: warning: search path '/usr/local/lib' not found
 *  Terminal will be reused by tasks, press any key to close it. 

 *  Executing task: swift build --build-tests 
```



# Platforms

```swift
platforms: [
    .macOS(.v14),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10),
    .macCatalyst(.v17),
    .visionOS(.v1),
    .driverKit,
    .linux
],
```


# Arguments

[Apple Docs](https://apple.github.io/swift-argument-parser/documentation/argumentparser/declaringarguments/)
```swift
    // A positional argument
    // Xcode argument string:
    // "someType"
    @Argument 
    var type: String
    
    // A named argument
    // Xcode argument string:
    // --mode="advertiser"
    @Option
//    var mode: String
    var mode: Mode
    
    // Presence of the named flag or not
    // Skewer case: --is-verbose unless specified
    // @Flag(name: .customLong("verbs"), help: nil)
    @Flag(
        name: [.long, .customLong("verbose")],
        help: "Verbose logging to stderr"
    )
    var isVerbose = false

```

```swift
/// ## Example Help
///
/// ```sh
/// $ ./zing append --help
/// USAGE: hatch-module --name <name> [<test-types> ...]
///
/// ARGUMENTS:
///   <test-types>            Type of test targets to include (values: unit, integration, ui)
/// ```
///
/// ## Example Usage:
/// ```sh
/// $ ./zing append --name "NyMod" unit ui
/// ```
///
/// ## Cons
/// * unnamed params on commands line
/// * Defining multiple is unintiuitive
@Argument(
    help: "Type of test targets to include"
) var testTypes: [TestType] = []


/// ## Example Help
///
/// ```sh
/// $ ./zing append --help
/// USAGE: hatch-module append --name <name> --test-types <test-types>
///
/// OPTIONS:
///   --test-types <test-types>
///                           Type of test targets to include (values: unit, integration, ui)        /// ```
/// ```
///
/// ## Example Usage
///
/// ```sh
/// $ ./zing append --name "MyMod" --test-types ui unit
/// ```
///
/// ## Cons
/// * Defining multiple is unintiuitive
@Option(
    name: .long,
    parsing: .upToNextOption,
    help: "Type of test targets to include"
)
var testTypes: [TestType]


/// ## Example Help
///
/// ```sh
/// $ ./zing append --help
/// $ ./zing append --help
/// USAGE: hatch-module append --name <name> [--include-unit-tests] [--include-integration-tests] [--include-ui-tests]
///
/// OPTIONS:
///   --include-unit-tests/--include-integration-tests/--include-ui-tests
///                           Include unit tests
/// ```
///
/// ## Example Usage
///
/// ```sh
/// $ ./zing append --name "MyMod" --test-types ui unit
/// ```
///
/// ## Pros
/// * Syntax is clear
///
/// ## Cons
/// * Syntax is verbose
@Flag(
    help: ArgumentHelp(
        "Include unit tests"
    )
) var testTypes: [TestType] = []

/// $ ./zing append --help
/// USAGE: hatch-module append --name <name> [--include-unit-tests] [--include-integration-tests] [--include-ui-tests]
///
/// OPTIONS:
///   --name <name>           The name of the Module. EX: HatchFeatureThing
///   --include-unit-tests    Include unit tests
///   --include-integration-tests
///                           Include unit tests
///   --include-ui-tests      Include unit tests
///
/// ## Pros
/// * Syntax is clear
///
/// ## Cons
/// * Syntax is verbose
/// * Code is too messy
@Flag(
    help: ArgumentHelp(
        "Include unit tests"
    )
) var includeUnitTests = false
@Flag(
    help: ArgumentHelp(
        "Include unit tests"
    )
) var includeIntegrationTests = false
@Flag(
    help: ArgumentHelp(
        "Include unit tests"
    )
) var includeUITests = false
```

# Expanded Package Buildingq
* [Link](https://www.rambo.codes/posts/2021-12-28-a-document-based-app-in-swift-playgrounds-for-ipad)
* [See repo here](https://github.com/insidegui/DocumentBasedSwiftPlaygroundsApp)






# Plugins
* [link](https://github.com/apple/swift-package-manager/blob/main/Documentation/Plugins.md)

# ModuleAliasing
* [link](https://github.com/apple/swift-package-manager/blob/main/Documentation/ModuleAliasing.md)





ConformanceMacro


# Walking dependency graphs

For packages that have multiple targets, you may have to walk the trees
yourself using both of the following commands as well as running those commands
on external dependencies' Package.swift after they are resolved locally. 

## Dependency Cases

<!-- TODO: zakkhoyt - think of different
* product types: 
* target types: library, binary, executable

-->

* local packages (meaning another Package.swift already on disk as part of your source code)
* remote packages (similar to above, but must be resolved first)
* local targets (meaning multiple targets in a single Package.swift)
* remote targets (similar to above, but must be resolved first)

Perhaps 2 iterations. 
* one to build your own table of dep items (an array of dep items). 
* second pass to walk/build your own tree





## Dump Package.swift as JS

```sh
swift package dump-package \
--package-path "$1"
```


## Shows nested outward dependencies
```sh
swift package show-dependencies \
--package-path "$1" \
--format json 
```

## Shows inward target/product dependencies
```sh
swift package describe \
--package-path "$1" \
--type json \
| jq '. | .targets[] | select(.type == "library")'
```

## Set tools version



# Bug
```sh
# Show package
$ cat Package.swift

# show dirs
$ exa -T
.
├── Modules
│  └── spm6Test
│     ├── Sources
│     │  └── spm6Test.swift
│     └── Tests
│        └── spm6TestTests.swift
└── Package.swift

# show build
$ /Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build  

# add product
$ /Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-package add-product "RestfulAPI" --type library --targets "RestfulAPI"              
Updating package manifest at Package.swift... done.

# show dirs
$ exa -T
.
├── Modules
│  └── spm6Test
│     ├── Sources
│     │  └── spm6Test.swift
│     └── Tests
│        └── spm6TestTests.swift
└── Package.swift

# add target (note the output is even wrong)

$ /Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-package add-target "RestfulAPI" --type "library" --path "Modules/RestfulAPI/Sources"
Updating package manifest at Package.swift... done.
Creating directory Sources/RestfulAPI... done.
Writing Sources/RestfulAPI/RestfulAPI.swift... done.

# show dirs
$ exa -T
.
├── Modules
│  └── spm6Test
│     ├── Sources
│     │  └── spm6Test.swift
│     └── Tests
│        └── spm6TestTests.swift
├── Package.swift
└── Sources
   └── RestfulAPI
      └── RestfulAPI.swift

# show build
~/temp/spm6Test on  main! ⌚ 21:52:51
$ /Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build

error: 'spm6test': invalid custom path 'Modules/RestfulAPI/Sources' for target 'RestfulAPI'
error: ExitCode(rawValue: 1)
error: 'spm6test': invalid custom path 'Modules/RestfulAPI/Sources' for target 'RestfulAPI'

```
