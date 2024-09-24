
# URLService

An application and application extensions can write files in 2 places:
* Application Sandbox
* A Shared App Group

## Application Sandbox

An application stores its files in a directory known as the ***application sandbox***. This is a directory which is private to the app itself.
```
.
├── Documents/ # Log files, any other files you might want to write directly (json, xml, yaml, etc...)
├── Library/ # Caches, Preferences, etc... UserDefaults are stored under here
├── StoreKit/ # system
├── SystemData/ # system
└── tmp/ # system
```

### Directories by Platform
The directory path for ***application sandbox*** varies by platform. Here are some examples:
* iOS Hardware: `/var/mobile/Containers/Data/Application/92A2A191-465D-4640-9F50-A86B9E45A943`
* iOS Simulator: `~/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Data/Application/C9D72599-04FF-454F-9419-EC92A4F87115`
* Mac (iOS App): `~/Library/Containers/B3B0F27D-691F-4F5B-A24B-17F1C01DB6F7/Data`

### Files
A few examples of files stored in the ***application sandbox***:
* `UserDefaults.standard` data is stored in the ***application sandbox*** under `\(appSandboxURL)/Library/Preferences/com.hatchbaby.NightlightDevelopment.plist`
* `Logger` log files are stored in the ***application sandbox*** under: `\(appSandboxURL)/Documents/\(dateStamp).log`

## App Group (Shared)

Sometimes it may be useful for apps/extensions to share data. Apps cannot read data each others sandboxes but they *can* read from a shared `App Group`. This is a directory which is similar to an application sandbox with more open permission.

### Directories by Platform
Again, the directory path for an ***app group*** varies by platform. Here are some examples:
* iOS Hardware: `/private/var/mobile/Containers/Shared/AppGroup/D0D0B7AA-ECE6-40F6-B2BE-FC18E9265C84`
* iOS Simulator: `~/Library/Developer/CoreSimulator/Devices/7F8D5007-8C44-4192-BE81-140B8C99A96D/data/Containers/Shared/AppGroup/31884957-9C29-493A-8C63-081AA30C4BDD`
* Mac iOS App: `~/Library/GroupContainersAlias/group.com.hatchbaby.NightlightDevelopment`

### Files
A few examples of files stored in the ***app group***:
* `UserDefaults.appGroup` stores data in a shared ***app group*** under `\(appGroupURL)/Library/Preferences/group.com.hatchbaby.NightlightDevelopment.plist`
* `CoreDataService` stores its data in a shared ***app group*** under: `\(appGroupURL)/Nightlight.sqlite`




