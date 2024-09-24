# Downloads(all)
* https://developer.apple.com/download/all/

# iPad on M1
* settings bundle (visible as about window)
  * [Aboud/Settings Docs](https://developer.apple.com/documentation/uikit/mac_catalyst/displaying_a_preferences_window)
  * [Legacy Settings Docs](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html#//apple_ref/doc/uid/10000059i-CH6)
  * Child Panes in Settings
    * Refactor our Settings bundle to Configuration/Arguments
  * slider/textField dont' work, textView does
  * UserDefaults work here?
* how to show keyboard shortcuts window like on iPad (hold cmd key). Apple docs call it "discoverability heads-up display (HUD)"
  * [Menu shortcut docs](https://developer.apple.com/documentation/uikit/uicommand/adding_menus_and_shortcuts_to_the_menu_bar_and_user_interface)
* [make app macOS like](https://developer.apple.com/documentation/uikit/mac_catalyst/optimizing_your_ipad_app_for_mac) 


# On Demand Resources
https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/EnablingODR.html#//apple_ref/doc/uid/TP40015083-CH8-SW1

# Matter
https://developer.apple.com/videos/play/wwdc2021/10298/

# Comments (local code)
https://developer.apple.com/documentation/xcode/formatting-your-documentation-content#Link-to-Symbols-and-Other-Content

# Designed for iPad vs Catalyst
https://developer.apple.com/videos/play/wwdc2020/10114/
https://developer.apple.com/videos/play/wwdc2020/10206/

# iPad stuff
Multi columns, etc...
https://developer.apple.com/videos/play/wwdc2020/10105/

Keyboard shortcuts
https://developer.apple.com/videos/play/wwdc2021/10057/


# New SwiftUI clas
https://developer.apple.com/tutorials/app-dev-training


# SF Symbols
https://developer.apple.com/documentation/uikit/uiimage/creating_custom_symbol_images_for_your_app

# M1 / Designed for iPad
* Delete app bundle/sandbox:
```
cd ~/Library/Containers
# This will make the location obvious. It will be a UDID. 
find . | grep com.hatchbaby.NightlightDevelopment
```


# Async Await
[Reference](https://www.biteinteractive.com/swift-5-5-asynchronous-looping-with-async-await/)

* `async let` lets you declare now, await later. It's a compiler promise. 



## Actors
* can read actor properties, but not write (from non-isolated context)
* Run code on the main actor with `MainActor.run {}`. 
* Annotate function that should only run on MainActor with `@MainActor`.
<!-- * `Sendable`, `@Sendable`, `nonisolated`.  -->
* `Sendable` is a protocol that indicates that a given value is safe to use in concurrent code
* You use the `@Sendable` attribute to require thread-safe values in your code
* Use `nonisolated` to opt an actor method out of confienment. 
* `let item = XCTUnwrap(items["\(i)"])`
* `GlobalActor` is a single, shared actor that’s accessible from anywhere.
  * `@globalActor actor MyActor {}`
  * Confine another class to MyActor with annotation: `@MyActor class MyClass {...}` 


## debugQuickLookObject()
```
    @objc func debugQuickLookObject() -> Any? {
        return "My name is \(name) and I'm \(age)."
    }
```

# Shell Scripting
https://developer.apple.com/library/archive/documentation/OpenSource/Conceptual/ShellScripting/BeforeYouBegin/BeforeYouBegin.html


# DocC
* [Refs](https://useyourloaf.com/blog/xcode-docc-getting-started/)



# HatchHomework 
Things I learned while reviewing candidate's homework:

# Measurement / Units

## MKDistanceFormatter
```swift
private func distanceFormatter(
  distance: Double
) -> String {
    let measurement = Measurement(value: distance, unit: UnitLength.meters)
    let formatter = MeasurementFormatter()    
    formatter.unitStyle = .long
    formatter.numberFormatter.maximumFractionDigits = 2
    return formatter.string(from: measurement.converted(to: .miles))
}
```
```swift
let formattedDistance = MeasurementFormatter().string(from: Measurement(value: distance, unit: UnitLength.meters))
            
```



## IANA Standard
[Reference](https://www.iana.org/)

## Danger (GitHub Actions Plugin)
[Ruby Version](https://danger.systems/ruby/)

## Task.sleep
```swift
try await Task.sleep(for: .seconds(60))
```


## x-callback-url
* [specification](https://x-callback-url.com/specification/)
### Apps who use
* [home-control](https://apps.apple.com/us/app/homecontrol-menu-for-homekit/id1547121417?mt=12)
* [BetterDisplay](https://github.com/waydabber/BetterDisplay/wiki/Integration-features,-CLI)

# Tabular Data 
This is a Pandas like tool for Swift (csv, json, DataFrame, columns, rows, files)
* [Apple Docs](https://developer.apple.com/documentation/tabulardata)