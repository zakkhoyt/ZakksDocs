
# Precompiler Macros
[Apple Docs](https://developer.apple.com/documentation/xcode/running-code-on-a-specific-version)
```swift
#if os(iOS)
#elseif os(tvOS)
#elseif os(macOS)
#elseif os(watchOS)
#else
#endif
```

```swift
#if targetEnvironment(simulator)
  // Simulator!
#endif
```


## Mac Catalyst 

* [Make your iPad app more like a Mac app](https://developer.apple.com/documentation/uikit/mac_catalyst/optimizing_your_ipad_app_for_mac)

### Conditionally compile code for macCatalyst
```swift
#if targetEnvironment(macCatalyst)
  // macCatalyst!
#else

```

### Check at runtime if process is macCatalyst or not
```swift
if ProcessInfo.processInfo.isMacCatalystApp {
  // iOS app running on macOS device.
  if ProcessInfo.processInfo.isiOSAppOnMac {
    // Target is of type: Mac (Designed for iPad)
  } else {
    // Target is of type: Mac (Mac Catalyst)
  }
} else {
  // iOS app running on iOS device.
}


// // macCatalyst app
// ProcessInfo.processInfo.isMacCatalystApp: true
// ProcessInfo.processInfo.isiOSAppOnMac: false

// // Designed for iPad
// ProcessInfo.processInfo.isMacCatalystApp: true
// ProcessInfo.processInfo.isiOSAppOnMac: true
```



# Debugging & Reflection

```swift
print(1.0)
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ")
```

## Enum, Struct, Class 
```
// print
a
b
// debugPrint
MPMenuLearning.MyEnum.a
MPMenuLearning.MyEnum.b
// dump
- MPMenuLearning.MyEnum.a
- MPMenuLearning.MyEnum.b

// print 
MyStruct(name: "a")
MyStruct(name: "b")
// debugPrint
MPMenuLearning.MyStruct(name: "a")
MPMenuLearning.MyStruct(name: "b")
// dump
▿ MPMenuLearning.MyStruct
  - name: "a"
▿ MPMenuLearning.MyStruct
  - name: "b"

// print
MPMenuLearning.MyClass
MPMenuLearning.MyClass
// debugPrint
MPMenuLearning.MyClass
MPMenuLearning.MyClass
// dump
▿ MPMenuLearning.MyClass #0
  - name: "a"
▿ MPMenuLearning.MyClass #0
  - name: "b"
```

## With CustomStringConvertible and CustomDebugStringConvertible
```
// print
enum description a
enum description b
// debugPrint
enum debugDescription a
enum debugDescription b
// dump
- enum debugDescription a
- enum debugDescription b

// print
struct description a
struct description b
// debugPrint
struct debugDescription a
struct debugDescription b
// dump
▿ struct debugDescription a
  - name: "a"
▿ struct debugDescription b
  - name: "b"

// print
class description a
class description b
// debugPrint
class debugDescription a
class debugDescription b
// dump
▿ class debugDescription a #0
  - name: "a"
▿ class debugDescription b #0
  - name: "b"
```














# Swift 5.9 WWDC 
[WWDC Video](https://developer.apple.com/wwdc23/10164)
## Notes form video

### Macros

( Notice the `#Predicate` keyword)

```swift
@freestanding(expression)
public macro Predicate<each Input> (

- body: (repeat each Input) -> Bool
) -> Predicate<repeat each Input>

let pred = #Predicate<Person> {
$0.favoriteColor == .blue
}
let blueLovers = people.filter(pred)
``` 

### Consuming

#### ~Copyable
Supress the ability to copy value types
```swift
struct FileDescriptor: ~Copyable {
private var fd: CInt
```
After adding `~Copyable` to a value type, you can give it a `deinit`

Give ownership to callee instead of copying on

Calling a consumable gives up ownership the value you called. 
```swift
consuming func close() {
  Darwin.close(fd)
}
```
You can no longer use the value after this. **This is enforced by the compiler**. 


### C++
Must enable interoperablilty in project settings. 

### Cmake Support for swift

### Actors can now specify which dispatchQueue to run on 

```swift
protocol SerialExecutor: Executor {
```
```swift
actor MyConnection {
private var database: UnsafeMutablePointer<sqlite3>
private let queue: DispatchSerialQueue

nonisolated var unownedExecutor: UnownedSerialExecutor { queue.asUnownedSerialExecutor () }

init(filename: String, queue: DispatchSerialQueue) throws { ... }

func pruneoldEntries () { ... }
func fetchEntry<Entry> (named: String, type: Entry.Type) -> Entry? { ... }
}

await connection.pruneoldEntries ()
```


## Xcode logging
[WWDC video](https://developer.apple.com/wwdc23/10226)


## Preview
Works with UIKit and AppKit

```swift
#Preview {
let controller = DetailedMapViewController ()

controller.mapView.camera = MKMapCamera (
  lookingAtCenter: CLLocation(latitude:37.335_690, longitude:-122.013_330). coordinate,
  fromDistance: 0,
  pitch: 0,
  heading: 0
)
return controller
}
```


## bookmarks
Not more FIXME tags or #warning


## Previews
* Can preview UIKIt/AppKit
* Can preview live on real devices

##  More to watch
* DocC
* #Preview
* Parameter Packs
* Macros
* SwiftData


# String multiline, wrapping

* [Cheatsheet](https://useyourloaf.com/blog/swift-string-cheat-sheet/)

```swift
do {
    let text: String = "Here is a " +
    "single line String split into multiple " +
    "lines of Swift code."
    print(text)
}
print("")

do {
    let text: String = """
    Here is a \
    single line String split into multiple \
    lines of Swift code.
    """
    print(text)
}
print("")

do {
    let text: String = [
        "Here is a ",
        "single line String split into multiple ",
        "lines of Swift code."
    ].joined()
    print(text)
}
print("")

do {
    let text: String = "Here is a\n" +
    "multi-line String split into multiple\n" +
    "lines of Swift code."
    print(text)
}
print("")

do {
    let text: String = """
    Here is a
    multi-line String split into multiple
    lines of Swift code.
    """
    print(text)
}
print("")


Here is a single line String split into multiple lines of Swift code.

Here is a single line String split into multiple lines of Swift code.

Here is a single line String split into multiple lines of Swift code.

Here is a
multi-line String split into multiple
lines of Swift code.

Here is a
multi-line String split into multiple
lines of Swift code.
```


# Conformance

```swift
@frozen public struct UInt64 : FixedWidthInteger, UnsignedInteger {
extension UInt64 : CustomReflectable {
    /// A mirror that reflects the `Int64` instance.
    public var customMirror: Mirror { get }
}


public protocol BinaryInteger : CustomStringConvertible, Hashable, Numeric, Strideable where Self.Magnitude : BinaryInteger, Self.Magnitude == Self.Magnitude.Magnitude {
public protocol FixedWidthInteger : BinaryInteger, LosslessStringConvertible where Self.Magnitude : FixedWidthInteger, Self.Magnitude : UnsignedInteger, Self.Stride : FixedWidthInteger, Self.Stride : SignedInteger {
public protocol UnsignedInteger : BinaryInteger {

extension AsyncButton where Label == Text { // generic type
extension IoTStatusReasoning where Self.RawValue == Int { // assciateType
extension IoTPreviewable where Self: RestMiniConnection {
extension Collection where Element: ContentIdentifiable {

extension UserSessionFlag where Self: RawRepresentable, Self.RawValue == String { // combo
public extension ApolloExtension where Base: OptionalType, Base.WrappedType: Collection { // combo

```



# Reachability

[link](https://www.hackingwithswift.com/plus/networking/user-friendly-network-access)


# Attributes

* [link](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/)

## available

[link](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#available)

`unavailable`, `introduced`, `deprecated`, `introduced`, `obsoleted`, `message`, `renamed`

```swift
@available(*, deprecated, message: "Please adopt...")
```

```swift
@available(*, renamed: "contract(max:)")
@available(*, renamed: "contract(max:)", message: "Renamed to coordinate with similar structs")

@available(*, unavailable, renamed: "contract(max:)")
@available(*, unavailable, renamed: "contract(max:)", message: "Renamed to coordinate with similar structs")
```

```swift
if #available(iOS 10.0, *) {
}

if #available(iOS 17.2, *) {
}

if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
} else {
}
```



```swift
#if os(iOS)
```

```swift
#if swift(>=5.0)
print("Running Swift 5.0 or later")
#else
print("Running old Swift")
#endif
```

## Endian


To convert between big/little see `FixedWidthInteger`

```swift

/// Creates an integer from its big-endian representation, changing the byte
/// order if necessary.
///
/// - Parameter value: A value to use as the big-endian representation of the
///   new integer.
init(bigEndian value: Self)

/// Creates an integer from its little-endian representation, changing the
/// byte order if necessary.
///
/// - Parameter value: A value to use as the little-endian representation of
///   the new integer.
init(littleEndian value: Self)


/// The big-endian representation of this integer.
///
/// If necessary, the byte order of this value is reversed from the typical
/// byte order of this integer type. On a big-endian platform, for any
/// integer `x`, `x == x.bigEndian`.
var bigEndian: Self { get }

/// The little-endian representation of this integer.
///
/// If necessary, the byte order of this value is reversed from the typical
/// byte order of this integer type. On a little-endian platform, for any
/// integer `x`, `x == x.littleEndian`.
var littleEndian: Self { get }

/// A representation of this integer with the byte order swapped.
var byteSwapped: Self { get }
```


[Reference](https://reintech.io/blog/mastering-endianness-in-swift)
```sh

#if _endian(big)
// Code for reading file as is
#elseif _endian(little)
// Code for reversing the byte order
#endif

```



# Binary Path


```sh
# This one is executable
/Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift

/Applications/Xcode-16.0.0-Beta.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB
```

```sh
/usr/bin/swift
```

```sh

/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift --version
/Applications/Xcode-15.4.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift --version
/Applications/Xcode-15.4.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift --version
/Applications/Xcode-16.0.0-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift --version

```

## Finding Swift binaries

```sh

cd /Applications/Xcode-16.0.0-Beta.app/Contents
find . -name "swift"
find . -name "swift" | xargs realpath
```



