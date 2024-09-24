


```swift
let dateFormatter = ISO8601DateFormatter()
dateFormatter.formatOptions = [
    .withFullDate,
    .withFullTime,
    .withFractionalSeconds,
    .withTimeZone
]
print(dateFormatter.string(from: Date()))

```