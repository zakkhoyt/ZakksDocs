

```json
[{"bssid":"24:E8:53:2A:BD:CB","rssi":-60,"ssid":"AT_301_WLREL6325F_bdcb","encryption":"WPA2_PSK"},{"bssid":"40:70:09:6E:B2:F0","rssi":-68,"ssid":"Pretty Fly For A WiFi","encryption":"WPA2_PSK"},{"bssid":"66:A4:B7:AE:43:73","rssi":-88,"ssid":"Miller","en
```

```
error: The data couldn’t be read because it isn’t in the correct format.
subject: dataCorrupted
context: The given data was not valid JSON.
codingPath: 
underlyingError: The data couldn’t be read because it isn’t in the correct format.
```

---

Valid json, but wrong `Decodable` type (`MyStruct.self` vs `WifiNetwork.self`)
```json
[
    {
        "bssid": "AA:BB:CC:DD:EE:FF",
        "rssi": -68,
        "ssid": "Pretty Fly For A Wi-Fi",
        "encryption": "WPA2_PSK"
    },
    {
        "bssid": "99:AA:BB:CC:DD:EE",
        "rssi": -88,
        "ssid": "Steveweiser",
        "encryption": "WPA2_PSK"
    }
]
```

```
DecodingError
error: The data couldn’t be read because it isn’t in the correct format.
subject: typeMismatch: Dictionary<String, Any>
context: Expected to decode Dictionary<String, Any> but found an array instead.
codingPath: 
```

---

```json
```

```
```