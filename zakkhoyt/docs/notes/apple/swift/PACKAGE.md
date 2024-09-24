# Executable name vs exectuableTarget.name
[link](https://stackoverflow.com/a/47816649/803882)

```swift
import PackageDescription

let package = Package(
    name: "DemoProject",
    products: [
        .executable(
          name: "demo", 
          targets: ["DemoProject"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DemoProject",
            dependencies: []
        ),
    ]
)
```