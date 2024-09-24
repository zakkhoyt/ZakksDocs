
# References
* [elevate-your-docc](https://techmusings.optisolbusiness.com/how-to-elevate-your-docc-documentation-in-xcode-3aa152a7bb66) 
* [apple](https://developer.apple.com/documentation/xcode/slothcreator_building_docc_documentation_in_xcode)

## Referencing symbols in your Package

```swift
/// the ``LayoutSubview/place(at:anchor:proposal:)`` method on eacfah
```





# Command line
* [swift-docc](https://forums.swift.org/t/swift-docc-plugin-for-swiftpm/54725)


```swift
// To use the Swift-DocC plugin with your package, first add it as a dependency:
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/apple/swift-docc-plugin", branch: "main"),
    ],
    targets: [
        // targets
    ]
)
```

```sh
# You can then invoke the plugin from the root of your repository like so:
swift package generate-documentation
```
