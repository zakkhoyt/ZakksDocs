# C++ / Swift interoperability (Xcode 15+)
* [Swift/C++ Interoperability](https://www.swift.org/documentation/cxx-interop/#enabling-c-interoperability)

# Using C++ Types and Functions in Swift
[Reference](https://www.swift.org/documentation/cxx-interop/#using-c-types-and-functions-in-swift)
## Project Settings: 
* `bridging header` support
* `C++ and Objective-C Interoperability` -> `C++ / Objective-C++`
* `Enable C++ Exceptions` -> `true`

## Notes
* Instantiated C++ classes/structs in Swift are treated as Swift structs (C++ class is a Swift Struct)
  * This can be overridden using C++ annotations. [See here](https://www.swift.org/documentation/cxx-interop/#mapping-c-types-to-swift-reference-types)
* C++ enums appear in Swift as `Int32` enums  

# Using Swift Types and Functions from C++
[Using Swift Types and Functions from C++](https://www.swift.org/documentation/cxx-interop/#using-swift-types-and-functions-from-c)

## Project Settings: 
Similar to Swift/Obj-C, the C++ file must include a single file of the Swift module
* `#include "\(module.name)-Swift.h"`
* `#include "CPPSwift-Swift.h"`

## Notes:
* Swift objects are explosed through a C++ namespace (the module name)
  * `CPPSwift::SomeSwiftStruct swiftStruct;`
* A swift initializer is exposed in C++ as a function named `init`
  * `auto ss = CPPSwift::SomeSwiftStruct::init("MyName", 101);`




# C++ References
## Smart Pointers
* https://www.geeksforgeeks.org/smart-pointers-cpp/
* https://learn.microsoft.com/en-us/cpp/cpp/smart-pointers-modern-cpp?view=msvc-170#kinds-of-smart-pointers

## General C++ Questions
### Allocating class member vars on the stack
Suppose we are writing some class, `class MyConsumer{...};`. We want `MyConsumer` to contain a member variable of a type which comes from some bulky `.hpp` file. For the sake of example, suppose we want `MyConsumer` to contain a member variable of type `MySwiftClass` which is defined in `SomeSwiftPackage-Swift.hpp` (along with several other non-relevant classes):
```cpp
#include "SomeSwiftPackage-Swift.hpp" // <-- we don't want to force consumers to import all of SomeSwiftPackage-Swift
class MyConsumer{
public: 
  SomeSwiftPackage::MySwiftClass sc;
  // ...
};
```

To be a good citizen, we don't want to force consumers of `MyConsumer` to `#include SomeSwiftPackage-Swift.hpp` (in fact this example won't compile due to circular includes), and thus we cannot use this approach. This is a problem because the compiler needs to know what `MySwiftClass` is. How can we work around this?

The way I learned to deal with this situation (way back in c++98) was to `forward declare` the class:
```cpp
namespace SomeSwiftPackage {
  class MySwiftClass; // <-- We are now forward declaring SomeSwiftPackage::MySwiftClass. Include in the cpp file
}

class MyConsumer {
public: 
  MySwiftClass sc;
  // ...
};
```

We are getting closer, but it seems that `forward declares` required the use of pointers. Okay let's change `sc` to a pointer:
```cpp
class MySwiftClass;" 
class MyConsumer{
public: 
  MySwiftClass *sc; // <-- We changed `sc` to be a pointer.
  // ...
};
```
This works. We could also use an of the newer smart pointers. However this means that we are allocating on the heap. We can get by, but what if we want to allocate sc on the stack?

Looks like we are out of luck here. Why? C++ need to know the size of memory to allocate. Forward Declaring takes that away, thus we must use pointers (or references).




# Swift Packages (mixed languages)
* [Swift+C Package](https://github.com/rderik/SwiftCursesTerm/tree/main/Sources)
* [Build a Clock](https://rderik.com/blog/building-a-text-based-application-using-swift-and-ncurses/)


```swift
let package = Package(
    name: "SwiftCursesTerm",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftCursesTerm",
            targets: ["SwiftCursesTerm"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(
            name: "curses", 
            providers: [
                .apt(["ncurses"]),
                .brew(["ncurses"])
            ]
        ),
        .target(
            name: "SwiftCursesTerm",
            dependencies: ["curses"]
        ),
        .testTarget(
            name: "SwiftCursesTermTests",
            dependencies: ["SwiftCursesTerm"]
        ),
    ]
)
```

`Sources/curses/curses.h`

```cpp
#define _XOPEN_SOURCE_EXTENDED 1
#include <ncurses.h>
#include <locale.h>
```

`Sources/curses/module.modulemap`

```swift
module curses {
  header "curses.h"
  link "ncurses"
  export *
}
```
