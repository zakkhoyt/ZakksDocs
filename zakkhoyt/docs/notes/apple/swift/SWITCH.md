# Multiple / Optionals

* [Reference](https://www.hackingwithswift.com/articles/136/the-complete-guide-to-optionals-in-swift)

```swift
switch (thing.text, thing.error) {
case (.some(let text), .none):
  print("\(text), nil")
case (.none, .some(let error)):
  print("nil, \(error)")
case (_, _):
  print("_, _ (some other case)")
}

switch (thing.text, thing.error) {
case let (text?, nil):
  print("\(text), nil")
case let (nil, error?):
  print("nil, \(error)")
case (_, _):
  print("_, _ (some other case)")
}

```