# Intents

This article discusses `Intents` and `AppIntents`. 

## Overview

What are Intents? What are AppIntents? How do they differ? 

How to dontate (register) them, how to ship them, how to debug them. 

### AppIntents

By default, iOS launches your app in a limited mode in the background and executes the Intent’s `perform()`
function on an arbitrary queue.

* To override this behavior and launch the app in the foreground, set the intent’s`openAppWhenRun` variable to `true`.
* If your intent manipulates the app’s user interface, annotate `perform()` with `@MainActor`.

See ``ProgressReportingIntent`` for surfacing progress reporting in long running intents
See ``EnumerableEntityQuery`` for small number of entities for surfacing lists to find/query functions in shortcuts app
  vs ``EntityPropertyQuery`` for large numbers of entities, see also `findIntentDescription` property: https://developer.apple.com/videos/play/wwdc2023/10103/

* See `AppIntents.ProgressReportingIntent` for surfacing progress reporting in long running intents
* See `AppIntents.EnumerableEntityQuery` for small number of entities for surfacing lists to find/query functions in shortcuts app
    * About `findIntentDescription` property ([WWDC](https://developer.apple.com/videos/play/wwdc2023/10103/))
* See `AppIntents.EntityPropertyQuery` for large numbers of entities

Session 10170: Implement App Shortcuts with App Intents, and session 10169: Design App Shortcuts.

## References

### Hatch code examples
* `AppExtensions/HatchSleepAppIntents.swift`
* `ViewControllers/Routine/RoutineViewController+SiriIntents.swift`
* ``HatchSleepAppIntents``
* ``RoutineViewController+SiriIntents``

### WWDC

* [Donate Intents and expand your app's presence](https://developer.apple.com/wwdc21/10231)(WWDC21)
* [Implement App Shortcuts with App Intents](https://developer.apple.com/wwdc22/10170)(WWDC22)
* [Design App Shortcuts](https://developer.apple.com/wwdc22/10169)(WWDC22)
* [Dive into App Intents](https://developer.apple.com/wwdc22/10032)(WWDC22)
* [Migrate custom intents to App Intents](https://developer.apple.com/videos/play/tech-talks/10168)(Tech Talks)
* [Explore enhancements to App Intents](https://developer.apple.com/wwdc23/10103)(WWDC23)


### App Shortcuts
* App Shortcuts require no setup
* Available as soon as your app is installed (vs. donating)
* Can be run from Shortcuts, Spotlight, and Siri
* [ ] Add parameter summary (fancy in ShortcutsApp
* Intents can show custom UI during input confirm, other confirm, and on result. 
  * Return the view within the `.result(dialog:view:)`
* Custom params using `AppEntity` conformance to a struct + `@Parameter` annotation

* Shortcuts demo ideas
  * Turn on many Rest+ devices
  * Start wind-down, set iOS to do not disturb, turn down Homekit lights. 
  * Trigger events (time of day, location, focus filters, etc...)
  * Desktop shortcut icon
  * realistic
    * "Edit my Hatch alarm"
    * "Start my hatch routine"

### AppIntents
* Focus Filters seem to be a new replacement for WindDown
  * "Meet Focus Filters" WWDC22
* Intent can be use from:
  * Menu Bar
  * Share Extensions
  * Terminal
  * AppleScript
  * Home Screen
  * Suggestions
  * Lock Screen
  * Shortcuts Widgets
  * Quick Actions
  * Voice | Apple Watch
  * HomePod
  * Automations
  * Shortcuts App
  * Keyboard
  * Spotlight
* Intent parameters conform to `AppEnum` + `@Parameter` property wrapper
* Parameter summary makes the choices pretty in the dialogs in shortcuts
  * `AppIntent` should implement `static var parameterSummary: some ParameterSummary`
* For shelling into the app, `AppIntent` should implement `static var openAppWhenRun: Bool = true`
* Queries are an interface for retrieving Entities from your app
  * All Queries look up entities by ID
  * `StringQuery` looks up entities using a search string
  * `PropertyQuery` looks up entities based on other criteria
  * Queries can provide suggested entities to pick from
  * Provide an entity by making a struct that conforms to `AppEntity`
    * EX: `struct BookEntity: AppEntity, Identifiable`
  * Provide a query by making a struct conform to `EntityQuery`. 
    * EX: `struct BookQuery: EntityQuery`
* [ ] Implement multi-scene support for best performance in the background


### Widgets powered by Intents
* See WWDC: `Explore enhancements to App Intents`
* 
