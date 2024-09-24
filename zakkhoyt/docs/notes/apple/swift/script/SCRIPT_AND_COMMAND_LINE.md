
# Table of Contents
- [Table of Contents](#table-of-contents)
- [Arguments](#arguments)
  - [Arguments via CommandLine](#arguments-via-commandline)
  - [Arguments via ProcessInfo](#arguments-via-processinfo)
  - [Environment via ProcessInfo](#environment-via-processinfo)
- [Parsing Arguments](#parsing-arguments)
  - [ArgumentParser Package](#argumentparser-package)
    - [Multiple names](#multiple-names)
    - [Help](#help)
- [Exiting a script](#exiting-a-script)
  - [Using ArgumentParser](#using-argumentparser)
- [Running Asynchronous](#running-asynchronous)
  - [Using ArgumentParser](#using-argumentparser-1)
- [References](#references)
  - [ANSI colors,  menus, collecting input](#ansi-colors--menus-collecting-input)



# Arguments

## Arguments via CommandLine

`CommandLine.arguments` provides only the args that you passed in. 

```swift
import Foundation
print("Print arguments: \(CommandLine.arguments)")
print("Number of arguments:\(CommandLine.argc)")
print("Enumerate arguments:\(CommandLine.argc)")
for (index, arg) in CommandLine.arguments.enumerated() {
    print("index: \(index) arg: \(arg)")
}
```

## Arguments via ProcessInfo

`ProcessInfo.processInfo.arguments` includes the args that you passed in, but sometimes additional context. 
```swift
import Foundation
print("ProcessInfo.processInfo.arguments: \(ProcessInfo.processInfo.arguments)")
```

## Environment via ProcessInfo
You can access the shell environment using `ProcessInfo.processInfo.environment`. 

```swift
import Foundation
print("ProcessInfo.processInfo.environment: \(ProcessInfo.processInfo.environment)")
```

# Parsing Arguments

## ArgumentParser Package

* [Github Docs](https://apple.github.io/swift-argument-parser/documentation/argumentparser/)
* [swiftinit.org](https://swiftinit.org/docs/swift-argument-parser/argumentparser)
  * [Commands and Subcommands](https://swiftinit.org/docs/swift-argument-parser/argumentparser/commandsandsubcommands)
* [SeveralExamples](https://github.com/apple/swift-argument-parser/tree/main/Examples)

A 3rd party package `ArgumentParser` is a great tool, but only suitable for compiled projects, not scripts. 

* @Flag - A flag is a defaulted Boolean or integer value that can be changed by specifying the flag on the command line
* @Argument - Positional arguments are specified without a label and must appear in the command-line arguments in declaration order, not necessarily first or last.
* @Option - An option is a value that can be specified as a named value on the command line.
  * SingleValueParsingStrategy - The strategy to use when parsing a single thing (string, int, etc...)
  * ArrayParsingStrategy - The strategy to use when parsing multiple values from @Option arguments into an array.
* @OptionGroup - Use an option group to include a group of options, flags, or arguments declared in a parsable type.

```swift
struct IIconParser: ParsableCommand {
    @Option(
        name: .customLong("inputFile", withSingleDash: false),
        parsing: .next,
        help: "Path to the input image file (relative or absolute). This should be large such as 1024x1024.",
        completion: nil
    ) var inputFilePath: String
    
    @Option(
        name: .customLong("devices", withSingleDash: false),
        parsing: .upToNextOption,
        help: "The devices to generated icons for. [\(AppIcon.Device.allCases.map{$0.rawValue}.joined(separator: ", "))]"
    ) var deviceStrings: [String]

    func run() throws {
        // Map/inspect values here. Throw errors to exit
    }
}
```

### Multiple names
```swift
@Flag(name: [.customLong("hex-output"), .customShort("x")],
      help: "Use hexadecimal notation for the result.")
var hexadecimalOutput = false
```


### Help
ArgumentParser can help produce a help page as well. 

```swift
struct EchoSwiftParser: ParsableCommand {
    /// This changes the name that appear in `help`.
    /// Without this it will be called `EchoSwiftApp`
    /// Also lets us customize more help information.
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "echo_swift",
            abstract: "A wrapper around echo which includes ANSI color support.",
            discussion: "Makes it easy to add color to existing echo code."
        )
    }
    
    func run() throws {
    }
}
```



# Exiting a script

At any time, call `os.exit(UInt8)`
* `$ echo $? # 255`
* prints nothing to `stderr`

## Using ArgumentParser

At any time, call `ParsableCommand.exit(withError: Error?)`

* When passed `enum Error: Swift.Error`
  * Prints to stderr: `Error: someError(message: "my message")`
  * `$ echo $? # 1`
* When passed `enum Error: LocalizedError)`. 
  * Prints to stderr: `LocalizedError` -> `var errorDescription: String?` (if implemented.)
  * Prints to stderr: `Error: Failed cause reason A`
  * `$ echo $? # 1`
 

# Running Asynchronous

Normally a Swift script exits at the end of the code. We can keep execution going if we want to wait for async tasks to finish such as HTTP calls. 

```swift
Task {
    await MyClass.myAsyncTask
}

// This keeps the script open so asyncronous code can be executed.
RunLoop.main.run()
```

## Using ArgumentParser
```swift
struct EchoSwiftParser: ParsableCommand {
    func run() throws {
        Task {
            await MyClass.myAsyncTask
        }
    }
}

// Entry point into our code
EchoSwiftParser.main()

// This keeps the script open so asyncronous code can be executed.
RunLoop.main.run()
```

# References

## ANSI colors,  menus, collecting input
[link](https://www.polpiella.dev/how-to-make-an-interactive-picker-for-a-swift-command-line-tool)


