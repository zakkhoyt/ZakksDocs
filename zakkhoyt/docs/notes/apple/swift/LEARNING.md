* Measurement<UnitLength>
* `DictionaryRepresentable`
* @frozen keyword (see `UnsafeMutableRawPointer` for example)

# Charts
* 5 axis plot (like RE4 or taste plots)


# debugging
* print
* debugPrint 
  * String(reflecting: item)
* AnyObject / AnyClass

## Exceptions
"NSInvalidAraumentException"


# SwiftUI
```swift
@State var currentLocation: CLLocation?

.onChange(of: currentLocation, initial: true) { oldValue, newValue in
    // ... 
}
```

# Swift


## CustomNSError
```swift
/// Describes an error type that specifically provides a domain, code, and user-info dictionary.
protocol CustomNSError : Error
```


