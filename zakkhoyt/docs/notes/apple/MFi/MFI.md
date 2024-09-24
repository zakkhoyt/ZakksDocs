* [Apple Tech Notes](https://developer.apple.com/documentation/technotes)

# WiFi
* [Apple WiFi APIs](https://developer.apple.com/documentation/technotes/tn3111-ios-wifi-api-overview)

## WiFi (w/o MFi)
* [NEHotspot](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager)
* [Sample Project](https://developer.apple.com/documentation/networkextension/configuring_a_wi-fi_accessory_to_join_the_user_s_network)
  * Entitlements
    * [com.apple.developer.networking.HotspotConfiguration](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_networking_hotspotconfiguration)
      * [NetworkExtension.NEHotspotConfigurationManager](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager?language=objc)
      * [NetworkExtension.NEHotspotConfiguration](https://developer.apple.com/documentation/networkextension/nehotspotconfiguration?language=objc)
    * [com.apple.developer.networking.wifi-info](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_networking_wifi-info)
      * [SystemConfiguration.CNCopyCurrentNetworkInfo()](https://developer.apple.com/documentation/systemconfiguration/1614126-cncopycurrentnetworkinfo?language=objc)
      * [NEHotspotNetwork.fetchCurrentWithCompletionHandler](https://developer.apple.com/documentation/networkextension/nehotspotnetwork/3666511-fetchcurrentwithcompletionhandle?language=objc)
  * [NEHotspotHelper](https://developer.apple.com/documentation/networkextension/hotspot_helper)
    * Scott was worried about some entitlements, but I think he was mistakend for this one (which isnt' used in the project)
    * `com.apple.developer.networking.HotspotHelper`


* Scott was worried about entitlements, but that's a different entitlement. However this entitlement can be [obtained from Apple with out MFi through application](https://developer.apple.com/contact/request/hotspot-helper/). [And specs here](https://developer.apple.com/documentation/technotes/tn3111-ios-wifi-api-overview)
  * [NEHotspotHelper](https://developer.apple.com/documentation/networkextension/hotspot_helper)
    * [com.apple.developer.networking.HotspotHelper](https://developer.apple.com/documentation/networkextension/hotspot_helper)


* I reviewed the plan above with Stuart. He advised:
  * See if esp32 can be AP and join at the same time. 
    * After reviewing MFi's WAC, they use pretty much this same approach and also outline a sequence that they expect so that the the accessory doesn't have to do both roles. This would probably work for us without MFi, but we would still need to prompt the user for SSID/PW. 

## WiFi (w/MFi)
* [EAAccessoryManager](https://developer.apple.com/documentation/externalaccessory/eaaccessorymanager) 
* [Wireless Accessory Configuration](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_external-accessory_wireless-configuration)



# BLE/ligthning (w/MFi)
* [externalaccessory](https://developer.apple.com/documentation/externalaccessory) - Communicate with accessories that connect to a device with the Apple Lightning connector, or with Bluetooth wireless technology.



# BLE

## BLE block size
* In our homegrown algorthm, can we now send more bytes per packet
* Does apple support bulk transfers now? We originally made our homegrown algorthm because Apple did not. 


# Auth Coprocessor Cost in bulk

---

# TODO
* BLE vs non-MFi vs MFi
* BLE
  * gather metrics about durations, failures
* non==