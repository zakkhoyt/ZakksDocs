
# Float on top (mac)



```swift
#if os(macOS)

// In NSApplicationDelegate
@MainActor func applicationDidFinishLaunching(
    _ notification: Notification
) {
    if let window = NSApplication.shared.windows.first {
        window.floatOnTop(enable: true)
    }
}
extension NSWindow {
    fileprivate func floatOnTop() {
        collectionBehavior = [.fullScreenPrimary]
        level = .floating
    }
}


#endif
```


# Make a Spotlight type app

[Reference](https://www.markusbodner.com/til/2021/02/08/create-a-spotlight/alfred-like-window-on-macos-with-swiftui/)