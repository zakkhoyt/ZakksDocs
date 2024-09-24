# MemoryLayout and Pointers

# MemoryLayout 
* [RayWenderlich](https://www.kodeco.com/7181017-unsafe-swift-using-pointers-and-interacting-with-c) 
* [Mike Ash](https://www.youtube.com/watch?v=ERYNyrfXjlg/)
* [Article](https://www.vadimbulavin.com/swift-pointers-overview-unsafe-buffer-raw-and-managed-pointers/)


```swift
MemoryLayout<T>.size // The number of bytes 

// How to align the memory. 
// EX: If `2`, address must be an even number. If `4`, then address % 4 == 0, etc...
MemoryLayout<T>.alignment 

// When you pack a bunch of `T` together, they pack at an interval of stride. 
// For basic types, the `size` is the same as the `stride`. 
MemoryLayout<T>.stride 
```

## Structs
```swift

struct SampleStruct {
  let number: UInt32
  let flag: Bool
}

MemoryLayout<SampleStruct>.size       // returns 5
MemoryLayout<SampleStruct>.alignment  // returns 4
MemoryLayout<SampleStruct>.stride     // returns 8
```

## Classes

```swift
class SampleClass {
  let number: Int64 = 0
  let flag = false
}

MemoryLayout<SampleClass>.size      // returns 8 (on 64-bit)
MemoryLayout<SampleClass>.stride    // returns 8 (on 64-bit)
MemoryLayout<SampleClass>.alignment // returns 8 (on 64-bit)
```

# Pointers
* [RayWenderlich](https://www.kodeco.com/7181017-unsafe-swift-using-pointers-and-interacting-with-c) 
* [Mike Ash](https://www.youtube.com/watch?v=ERYNyrfXjlg/)

Types that involve direct memory access get an `unsafe` prefix (compiler can't help check these). 

## Pointer Types


Unsafe Swift pointers use a predictable naming scheme that describes the pointers’ traits: mutable or immutable, raw or typed, buffer style or not. In total, there are eight pointer combinations. 

Unsafe `[Mutable]` `[Raw]` `[Buffer]` Pointer`[<T>]` 

|Pointer Name|Unsafe?|Write Access?|Collection?|Strideable?|Typed?|
|---|---|---|---|---|---|
|UnsafeMutablePointer<T>|уер|уер|поре|уер|уер|
|UnsafePointer<T>|уер|поре|поре|уер|уер|
|UnsafeMutableBufferPointer<T>|yep|уер|yep|поре|уер|
|UnsafeBufferPointer<T>|vep|поре|уер|поре|уер|
|UnsafeMutableRawPointer|уер|yep|поре|уер|поре|
|UnsafeRawPointer|уер|поре|поре|уер|поре|
|UnsafeMutableRawBufferPointer|уер|yep|уер|поре|nope|
|UnsafeRawBufferPointer|уер|поре|уер|nope|поре|

* Pointers are just memory addresses.
* Direct memory access is Unsafe.
* Mutable means you can write to it.
* Raw means it points to a blob of bytes.
* Buffer means that it works like a collection.
* Generic <T> pointers are typed.


`UnsafeMutablePointer<Int>` has `pointee`

`UnsafeMutablePointer<T>` is enumerable

## Inspect bytes of a value typed
```swift
var buffer = [Float](repeating: 0, count: 10)

buffer.withUnsafeBytes { ptr in
  print("buffer.withUnsafeBytes: \(ptr)")
}

buffer.withUnsafeBufferPointer { ptr in
  print("buffer.withUnsafeBufferPointer: \(ptr)")
}

buffer.withUnsafeMutableBytes { ptr in
  print("buffer.withUnsafeMutableBytes: \(ptr)")
}

buffer.withUnsafeMutableBufferPointer { ptr in
  print("buffer.withUnsafeMutableBufferPointer: \(ptr)")
}

buffer.withContiguousStorageIfAvailable { ptr in
  print("buffer.withContiguousStorageIfAvailable: \(ptr)")
}

// buffer.withUnsafeBytes: UnsafeRawBufferPointer(start: 0x0000600002a48930, count: 40)
// buffer.withUnsafeBufferPointer: UnsafeBufferPointer(start: 0x0000600002a48930, count: 10)
// buffer.withUnsafeMutableBytes: UnsafeMutableRawBufferPointer(start: 0x0000600002a48930, count: 40)
// buffer.withUnsafeMutableBufferPointer: UnsafeMutableBufferPointer(start: 0x0000600002a48930, count: 10)
// buffer.withContiguousStorageIfAvailable: UnsafeBufferPointer(start: 0x0000600002a48930, count: 10)

// Alternatively we could get only the base address like so:
print("ptr.baseAddress: \(ptr.baseAddress)")
```


## Convert Array to Pointer then back to Array

* [SO](https://stackoverflow.com/questions/32606989/converting-an-unsafepointer-with-length-to-a-swift-array-type)