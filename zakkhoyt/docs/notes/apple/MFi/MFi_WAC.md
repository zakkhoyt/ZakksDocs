

# WAC

Content below was taken from `Wi-Fi Accessory Configuration Specification R2.pdf`

## Accessory Configuration Requirements
* Wi-Fi Accessory Configuration accessories must include an 802.11b/g, 802.11n, or 802.11ac radio module and a status indicator to indicate when the accessory is in Wi-Fi Accessory Configuration mode. Apple recommends that this status indicator only be used for indicating when the accessory is in Wi-Fi Accessory Configuration mode, and not be used for any other purpose.
* The accessory must support the ability for the user to manually enter Wi-Fi Accessory Configuration mode as well as perform a factory reset of the accessory. All user-specific information must be erased when performing a factory reset. This includes (see doc for more)
* The accessory must be able to act as both a software Access Point (AP) and as a station (STA) device. 


## Accessory Behavioral Requirements

* The accessory must automatically enter Wi-Fi Accessory Configuration mode when it is in a non-configured state.
* The accessory must exit Wi-Fi Accessory Configuration mode when it has been idle for more than 15 minutes.
* The accessory may offer a mechanism for exiting Wi-Fi Accessory Configuration mode in response to a direct user action.
* The software Access Point (AP) must use a unique SSID when entering Wi-Fi Accessory Configuration mode.
* The accessory must enter a non-configured state when the accessory's network credentials have been reset to factory setting.
* Configured accessories must not enter Wi-Fi Accessory Configuration mode automatically upon disconnecting from a network.
* Accessories should support alternative methods of configuration for devices that do not support the Wi-Fi Accessory Configuration feature.

## Wi-Fi Accessory Configuration Network Requirements
* All Wi-Fi Accessory Configuration accessories must support a wireless network connection and Bonjour, Apple's service discovery protocol. Accessories must also support changing the Bonjour name to a user defined value. The default name of all accessories must be unique out of the box.

* When in Software AP mode, the accessory must have a DHCP server as well as an HTTP server that supports persistent connections, i.e. multiple HTTP requests sent through the came TCP connection. When in STA mode, the accessory must support link-local IPv4 addressing as specified in RFC 3927.


## Wi-Fi Accessory Configuration Implementation Requirements
* All Wi-Fi Accessory Configuration accessories must meet all applicable requirements in this specification and must incorporate the Apple Authentication Coprocessor, see Apple Authentication 3.0 Coprocessor in the. (see page 26 in `Accessory Interface Specification R41.pdf`)
* [ ] Review with Stuart as a litmus test
  * [ ] packaging (16 pin)
  * [ ] i2c
  * [ ] electrical requirements
  * [ ] firmware requirements
  * [ ] factory requirements
* [ ] Obtain pricing
  * [ ] $1.20 for 20 or 6 cents (small batch for dev)
  * [ ] $1.00 ror 100 (in bulk)


## Wi-Fi Certification Requirements
Wi-Fi Accessory Configuration accessories must complete the following certification requirements:
• Wi-Fi CERTIFIED™ (http://www.wi-fi.org/certification)
• MFi certification (https://mfi.apple.com/)



--- 
Sofware Token Auth

* Set up Server which talke with apple to put software token on our acccessories
* Supports
  * airplay
  * homekit
  * find my
* Install token either
  * in factory
  * in field using iOS app (with entitlement)