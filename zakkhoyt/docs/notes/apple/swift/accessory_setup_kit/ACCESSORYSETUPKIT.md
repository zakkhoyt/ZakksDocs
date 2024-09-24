AccessorySetupKit was introduced in iOS 18. It gives a HomeKit style UI/behavior to BLE / WiFi accessory setup.

# About
* Gives a HomeKit style UI 
* The user can use Hatch devices without granting overly-broad or long-lasting Bluetooth access.
  * User is no longer asked about BLE permissions, etc... 
* User does not need to leave the app (go to settings)
* Offers compatiblity and migration from current CoreBluetooth code
* Accessories will reside under a new section in `iOS Settings -> Privacy & Security -> Accessories -> $APP`
  * App will still reside under `iOS Settings -> $APP`, but:
    * Will have a new "Accessories" submenu
    * The old `CoreBluetooth` should might not be present anymore (it's not in Apple's demo app, but ours is more complicated)

* Note: Does not help us with WiFi SSID access 


# References
* [AccessorySetupKit WWDC](https://developer.apple.com/videos/play/wwdc2024/10203/)
* [Apple Docs w/Example Code Projects](https://developer.apple.com/documentation/accessorysetupkit/authorizing-a-bluetooth-accessory-to-share-a-dice-roll) 

# Questions
* [X] ~~*How does backwards comp work?*~~ [2024-07-06]
  * `ASAccessory.showPicker(...)` will pass back a `ASAccessoryEventType.accessoryAdded`. 
    * Capture `event.accessory` here. 
    * `ASAccessory.showPicker(...)` will pass back a `ASAccessoryEventType.pickerDidDismiss`. 
    * Use your retained `event.accessory.bluetoothIdentifier` (a `peripheral.identifier`) to retrieve the peripheral from `CBCentralManager`
    * Connect/discover as normal
* [X] ~~*How does migration work?*~~ [2024-07-06]
  * You can also perform a one-time migration of previously-configured accessories, which adds them to AccessorySetupKit’s store of known accessories.
  * Create instances of `ASMigrationDisplayItem` and include them in the array passed to `showPicker(...)`. 
  * Items to migrate need to additionally supply either an `peripheral.identifier` or `hotspotSSID`
    * For Bluetooth accessories, the accessory identifiers you use in display items need to match the values you supply in the app’s information property list.
  * If all goes well, receive `ASAccessoryEventType.migrationComplete`
* [X] ~~*Do we have to declare EVERY service SSID or just one? `ASPickerDisplayItem`*~~ [2024-07-10]
  * A: Just one, the one that is associated with `CBAdvertisementDataServiceUUIDsKey` in the advertisment
* [X] ~~*3d image for sheet (like airpods)*~~ [2024-07-10]
  * A: Looks like it needs ot be a `UIImage`, so static image. 
* [X] ~~*Is it AccessorySetupKit compatible with everything we do?*~~ [2024-07-10]
  * [X] ~~*Reading (rapidly changing) advertisment data (`ASAccessoryEventType.accessoryChanged`)*~~ [2024-07-10] 
    * A: Mostly. WE can parse advertisment, by pasing `manufacturerDataBlob` and `manufacturerDataMask`, but needs to be done prior to the scan response. 
  * [X] ~~*Faster BLE scan updates vs power consumption*~~ [2024-07-10]
    * A: It looks like we can't opt into this, but is that really a problem now adays?
* [ ] Does `AccessorySetupKit` always do the scan for us? Or just for registration?
* [ ] How does [ASAccessory.AccessoryState](https://developer.apple.com/documentation/accessorysetupkit/asaccessory/state) come into play? Does it intersect with permissions?
* [ ] Where do we encounter [ASError](https://developer.apple.com/documentation/accessorysetupkit/aserror)?

# Usage Overview 

## From WWDC Video
* Add AccessorySetupKit to Info. plist
* Activate ASAccessorySession
* Create ASPickerDisplayltem
* Show accessory picker and listen for events
* Migrate existing accessories with ASMigrationDisplayltem


## From Documentation
To discover accessories and present them in your app, you perform the following four steps:
* Declare that your app uses AccessorySetupKit in its information property list.
* In your app, create an instance of ASAccessorySession and activate it.
* Provide information about your supported accessories to display a picker (create `ASPickerDisplayltem`). 
  * This lets the person using your app discover and select nearby accessories to configure.
* Design assets for the accessory picker
* Display the picker...
* When the picker dismisses, use information about the selected device to create a Bluetooth or Wi-Fi connection.

## Tips (from WWDC video)
* Sheet image space is 180pt x 120pt. Use thin to zero alpha padding. 
* App ui will be covered by ASK UI, plan for it.  
* Bind the call to `showPicker()` to a button w/nearby copy about adding a device (so the user isn't surprsed())
  

