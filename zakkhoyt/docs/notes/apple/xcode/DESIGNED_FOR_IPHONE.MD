



# Designed for iPhone

## Directories

###  App Sandbox 
* As logged to console by HatchLogger, CoreDataStack
  * `~/Library/Containers/B3B0F27D-691F-4F5B-A24B-17F1C01DB6F7/Data`
* May look like this in `Finder`:
  * `~/Library/Containers/Hatch Sleep/Data`

### App Group: 
* Shared app group folder for Dev/QA
  * `~/Library/Group Containers/group.com.hatchbaby.NightlightDevelopment`
* Shared app group folder for Release
  * `~/Library/Group Containers/group.com.hatchbaby.Nightlight`

### App Binary (there are two dirs with the same content. Not aliased. Not sure what the difference is)
1) From `OS_ACTIVITY_MODE` logs:
  * `/private/var/folders/z8/kw3sbmpd0f5fxxh1_4bsf7hr0000gn/X/F31D5D33-5305-5483-A658-8A63B5038EBC/d/Wrapper/Nightlight.app`
  * Aliased to:
    * `/var/folders/z8/kw3sbmpd0f5fxxh1_4bsf7hr0000gn/X/F31D5D33-5305-5483-A658-8A63B5038EBC/d/Wrapper/Nightlight.app/`
2) The App's binary (in the mac doc)
  * `/Users/zakkhoyt/Library/Developer/Xcode/DerivedData/Nightlight-fqwwqaajuaxmhkfyaoypfmqyoiwd/Build/Products/Debug_iPhone_Only-iphoneos/.XCInstall/Hatch Sleep 2.app/Wrapper/Nightlight.app`






## Validate URLs

### Real iPhone
```
logRelevantURLs() > [URLService] Application Sandbox Dir: /var/mobile/Containers/Data/Application/92A2A191-465D-4640-9F50-A86B9E45A943
logRelevantURLs() > [URLService] Shared App Group Dir: /private/var/mobile/Containers/Shared/AppGroup/D0D0B7AA-ECE6-40F6-B2BE-FC18E9265C84
logRelevantURLs() > [URLService] UserDefaults.standard plist url: /var/mobile/Containers/Data/Application/92A2A191-465D-4640-9F50-A86B9E45A943/Library/Preferences/com.hatchbaby.NightlightDevelopment.plist
logRelevantURLs() > [URLService] App group userDefaults: /private/var/mobile/Containers/Shared/AppGroup/D0D0B7AA-ECE6-40F6-B2BE-FC18E9265C84/Library/Preferences/group.com.hatchbaby.NightlightDevelopment.plist
2023-06-21 21:05:48.968929-0600 Nightlight[679:24730] [User Defaults] Couldn't read values in CFPrefsPlistSource<0x14f835f00> (Domain: group.com.hatchbaby.NightlightDevelopment, User: kCFPreferencesAnyUser, ByHost: Yes, Container: (null), Contents Need Refresh: Yes): Using kCFPreferencesAnyUser with a container is only allowed for System Containers, detaching from cfprefsd
logRelevantURLs() > [URLService] Read value from appGroup userDefaults: appGroupValueRealiPhone
```
* [X] ~~*SandboxDir*~~ [2023-06-21]
* [X] ~~*AppGroupDir*~~ [2023-06-21]
* [X] ~~*UserDefaults.standard*~~ [2023-06-21]
* [X] ~~*UserDefaults.appGroup*~~ [2023-06-21]

### Sim
```
logRelevantURLs() > [URLService] Application Sandbox Dir: /Users/zakkhoyt/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Data/Application/C9D72599-04FF-454F-9419-EC92A4F87115
logRelevantURLs() > [URLService] Shared App Group Dir: /Users/zakkhoyt/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Shared/AppGroup/31884957-9C29-493A-8C63-081AA30C4BDD
logRelevantURLs() > [URLService] UserDefaults.standard plist url: /Users/zakkhoyt/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Data/Application/C9D72599-04FF-454F-9419-EC92A4F87115/Library/Preferences/com.hatchbaby.NightlightDevelopment.plist
logRelevantURLs() > [URLService] App group userDefaults: /Users/zakkhoyt/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Shared/AppGroup/31884957-9C29-493A-8C63-081AA30C4BDD/Library/Preferences/group.com.hatchbaby.NightlightDevelopment.plist
logRelevantURLs() > [URLService] Read value from appGroup userDefaults: appGroupValueSim
```
* [X] ~~*SandboxDir*~~ [2023-06-21]
* [X] ~~*AppGroupDir*~~ [2023-06-21]
* [X] ~~*UserDefaults.standard*~~ [2023-06-21]
* [X] ~~*UserDefaults.appGroup*~~ [2023-06-21]

### Designed for iPhone
```
logRelevantURLs() > [URLService] Application Sandbox Dir: /Users/zakkhoyt/Library/Containers/B3B0F27D-691F-4F5B-A24B-17F1C01DB6F7/Data
logRelevantURLs() > [URLService] Shared App Group Dir: /Users/zakkhoyt/Library/GroupContainersAlias/group.com.hatchbaby.NightlightDevelopment
logRelevantURLs() > [URLService] UserDefaults.standard plist url: /Users/zakkhoyt/Library/Containers/B3B0F27D-691F-4F5B-A24B-17F1C01DB6F7/Data/Library/Preferences/com.hatchbaby.NightlightDevelopment.plist
logRelevantURLs() > [URLService] App group userDefaults: /Users/zakkhoyt/Library/GroupContainersAlias/group.com.hatchbaby.NightlightDevelopment/Library/Preferences/group.com.hatchbaby.NightlightDevelopment.plist
2023-06-21 19:14:42.780165-0600 Nightlight[71134:3579512] [User Defaults] Couldn't read values in CFPrefsPlistSource<0x12396a150> (Domain: group.com.hatchbaby.NightlightDevelopment, User: kCFPreferencesAnyUser, ByHost: Yes, Container: (null), Contents Need Refresh: Yes): Using kCFPreferencesAnyUser with a container is only allowed for System Containers, detaching from cfprefsd
logRelevantURLs() > [URLService] Read value from appGroup userDefaults: appGroupValueDfI

```
* [X] ~~*SandboxDir*~~ [2023-06-21]
* [X] ~~*AppGroupDir*~~ [2023-06-21]
* [X] ~~*UserDefaults.standard*~~ [2023-06-21]
* [X] ~~*UserDefaults.appGroup*~~ [2023-06-21]
* [ ] What abotu the CFPrefsPlistSource<0x12396a150> error in the logs above?














### Multiple app builds.

Each build is number and live side by side. This is just the binary portion. The "sandbox" lives in a different folder which is shared between all of these builds. 
```sh
~/Library/Developer/Xcode/DerivedData/Nightlight-gwifezhwgqxmnsddwtpogtlrsiih/Build/Products/Debug_iPhone_Only-iphoneos/.XCInstall/Hatch Sleep.app/Wrapper/Nightlight.app
~/Library/Developer/Xcode/DerivedData/Nightlight-gwifezhwgqxmnsddwtpogtlrsiih/Build/Products/Debug_iPhone_Only-iphoneos/.XCInstall/Hatch Sleep 4.app/Wrapper/Nightlight.app
```

```
drwxr-xr-x@  28 zakkhoyt  staff        896 May 23 19:25 .
drwxr-xr-x    4 zakkhoyt  staff        128 May 23 22:29 ..
drwxr-xr-x@   5 zakkhoyt  staff        160 May 23 19:25 Amplitude_Amplitude.bundle
-rw-r--r--@   1 zakkhoyt  staff       6105 May 23 19:25 AppIcon-development60x60@2x.png
-rw-r--r--@   1 zakkhoyt  staff       7534 May 23 19:25 AppIcon-development76x76@2x~ipad.png
drwxr-xr-x@   8 zakkhoyt  staff        256 May 23 19:25 ArgumentKit_ArgumentKitUI.bundle
-rw-r--r--@   1 zakkhoyt  staff     350719 May 23 19:25 Assets.car
drwxr-xr-x@   3 zakkhoyt  staff         96 May 23 19:25 Base.lproj
drwxr-xr-x@  19 zakkhoyt  staff        608 May 23 19:25 Frameworks
drwxr-xr-x@  12 zakkhoyt  staff        384 May 23 19:25 HatchArcane_HatchArcane.bundle
drwxr-xr-x@   8 zakkhoyt  staff        256 May 23 19:25 HatchAssets_HatchAssets.bundle
drwxr-xr-x@   8 zakkhoyt  staff        256 May 23 19:25 HatchBrain_HatchBrain.bundle
drwxr-xr-x@  17 zakkhoyt  staff        544 May 23 19:25 HatchContent_HatchContent.bundle
drwxr-xr-x@   4 zakkhoyt  staff        128 May 23 19:25 HatchHUD_HatchHUD.bundle
drwxr-xr-x@   5 zakkhoyt  staff        160 May 23 19:25 HatchLogger_HatchLogger.bundle
drwxr-xr-x@   4 zakkhoyt  staff        128 May 23 19:25 HatchServiceBackendAPI_HatchServiceBackendAPI.bundle
drwxr-xr-x@   4 zakkhoyt  staff        128 May 23 19:25 HatchServiceBackendClient_HatchServiceBackendClient.bundle
drwxr-xr-x@ 212 zakkhoyt  staff       6784 May 23 19:25 HatchSleep_HatchSleep.bundle
-rw-r--r--@   1 zakkhoyt  staff       9387 May 23 19:25 HatchSubscription_development.storekit
drwxr-xr-x@   4 zakkhoyt  staff        128 May 23 19:25 HatchTools_HatchTools.bundle
-rw-r--r--@   1 zakkhoyt  staff       2440 May 23 19:25 Info.plist
-rwxr-xr-x@   1 zakkhoyt  staff  209651056 May 23 19:25 Nightlight
-rw-r--r--@   1 zakkhoyt  staff          8 May 23 19:25 PkgInfo
drwxr-xr-x@   5 zakkhoyt  staff        160 May 23 19:25 PromptMenu_PromptMenu.bundle
-rw-r--r--@   1 zakkhoyt  staff        162 May 23 19:25 README.md
drwxr-xr-x@   5 zakkhoyt  staff        160 May 23 19:25 Settings.bundle
drwxr-xr-x@   3 zakkhoyt  staff         96 May 23 19:25 _CodeSignature
-rw-r--r--@   1 zakkhoyt  staff      23215 May 23 19:25 embedded.mobileprovision
```

### App Group
```sh
~/Library/Containers/B3B0F27D-691F-4F5B-A24B-17F1C01DB6F7/Data 
```

```
lrwxr-xr-x     1 zakkhoyt  staff     19 Oct 29  2021 Desktop -> ../../../../Desktop
drwx------  1583 zakkhoyt  staff  50656 May 24 16:48 Documents
lrwxr-xr-x     1 zakkhoyt  staff     21 Oct 29  2021 Downloads -> ../../../../Downloads
drwx------    37 zakkhoyt  staff   1184 May 24 16:48 Library
lrwxr-xr-x     1 zakkhoyt  staff     18 Oct 29  2021 Movies -> ../../../../Movies
lrwxr-xr-x     1 zakkhoyt  staff     17 Oct 29  2021 Music -> ../../../../Music
lrwxr-xr-x     1 zakkhoyt  staff     20 Oct 29  2021 Pictures -> ../../../../Pictures
drwx------     3 zakkhoyt  staff     96 Aug 24  2022 StoreKit
drwx------     2 zakkhoyt  staff     64 Oct 29  2021 SystemData
drwx------     9 zakkhoyt  staff    288 May 24 16:48 tmp
```







# Drawbacks
* Most Unit Tests cannot run on Designed for iPhone scheme. 
  * Only those that have a full `mac` target (which some packages do)