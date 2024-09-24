


# NotificationCenter

The old way
```swift
NotificationCenter.default.addObserver(
    self,
    selector: #selector(applicationDidEnterBackground),
    name: UIApplication.didEnterBackgroundNotification,
    object: nil
)

@objc
private func applicationDidEnterBackground(note: Notification) {
    print("applicationDidEnterBackground")
}
```

The Combine way
```swift
NotificationCenter.default.publisher(
    for: .IoTReconnectManagerDidDisconnect,
    object: nil
)
.removeDuplicates()
.receive(on: DispatchQueue.main)
.sink { [weak self] notification in
    guard let self else { return }
    logger.debug("IoTDeviceConnectionStateClient.StatusMonitor: Did sink Notification: \(notification.name.rawValue)")

}
.store(in: &mqttSubscriptions)

```


# map / compactMap

```swift
// Search code for .map/compactMap succeeceded by .sink
connectionManager.allDevicesMQTTCommandResponseProvider
    .filter { $0.thing.macAddress == self.iotThing.macAddress }
    .map { $0.commandResponse }
    .sink { [weak self] commandResponse in
        self?.mqttCommandResponseProvider.send(commandResponse)
    }
    .store(in: &subscriptions)

```
