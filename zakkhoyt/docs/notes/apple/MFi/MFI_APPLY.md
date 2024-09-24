
* app.admin
  * update username (not lavender)
  * update hatch address/contact info


## Apple Dev
Entity name:Hatch Baby Inc.
Team ID: R9NLYTXPDC
Program: Apple Developer Program
Enrolled as: Organization
Phone: 1-650-4932828
Street address: 3476 South Ct Palo Alto, California 94306 United States
Account Holder: Chris Lavender
Your role: Account Holder
Renewal date: November 5, 2024

## DUNS website
Look up success using
Marcus Kazmierczak

HATCH BABY, INC.
3525 Alameda De Las Pulgas Ste D, Menlo Park,CA 94025-6571
650 438-1718





14:41
942892345

## current address
3790 El Camino Real
Unit #627
Palo Alto, CA 94306
support@hatch.co

## DUNS
942892345


* [Enroll](https://mfi.apple.com/account/licensee/3IifQHpKQfaOapxHGMbpKQ/page/a940c449-d7ad-309b-a83e-e8a6b06cc206)
  * sign in using app.admin account
  * Need DUNS# and similar


* [WiFi sharing](https://developer.apple.com/documentation/networkextension/configuring_a_wi-fi_accessory_to_join_the_user_s_network)

# Application
* Application submitted on 12/04/23 around 14:50 PM
  * Submitted under zakkhoyt's apple account
  * See `/Users/zakkhoyt/Documents/Images/screenshots/MFi` for screenshots of application
* [Success page](https://mfi.apple.com/account/licensee/3IifQHpKQfaOapxHGMbpKQ/thankyou)
* Received an email from MFi (zakkhoyt@hatchbaby.com)
* [See status](http://mfi.apple.com/login)


# Application Modification Request (12/05/23)

I received an email from MFi team

```
Hello Zakk,

Thank you for applying to the MFi Program. To help us process your application, please make the following updates and resubmit your application.


Please provide a high-level description of the accessory that you intend to develop under the MFi Program. Please indicate how the accessory would connect to, and communicate with the Apple device (e.g. Wi-Fi, Bluetooth, BLE, dock connector).
You may clarify the above in the 'Additional comments' field of your enrollment form.


If you’re submitting online, sign in to the MFi Portal. You’ll be prompted to sign in with your Apple ID that uses an email associated with your company's website domain. If your application doesn't include a requested update, processing may be delayed.

MFi Program Team
```

## Response
```markdown
We at Hatch make what you could call Smart Nightlights, Smart Alarm Clocks, or Smart Sound Machines. Generally they are ESP32 powered devices which are equipped with RGBW leds and audio hardware (speaker, amplifier, etc...) and live on the user's nightstand. Our [hardware products](https://www.hatch.co/shop-all#compare-devices) and [iOS App (HatchSleep)](https://apps.apple.com/us/app/hatch-sleep/id1158048301) have been on the market for several years.

Why MFi? We are looking to use MFi to improve our products and user experience:
* Wi-Fi Accessory Configuration (primary goal)
* Homekit (secondary goal)
* Airplay/Bluetooth (secondary goal)

# Wi-Fi Accessory Configuration (WAC)

While all of our products are unique, they all need to join the user's home WiFi network. What that looks like currently: Our iOS app and our hardware communicate back and forth over `BLE`. First our app tells our hardware to scan for WiFi networks. The hardware scan then sends the list of ssids to the app. The app then prompts the user to select a WiFi network from the list, prompts the user to enter the WiFi password, then transfers those credentials back over `BLE` to the device. App waits for the hardware to join WiFi. 

This flow is time consuming, cumbersome for the user, and proned to errors and timeouts. We are looking to streamline this flow with `MFi / Wi-Fi Accessory Configuration (WAC)`

# HomeKit
We are considering adding Homekit support to some of our products as RGB lights. 

# Airplay/Bluetooth
We are considering adding Airplay support to some of our products (allow the user to use our device as as an Airplay or stream our audio content from our app to our hardware over Bluetooth).
```



# Application Modification Request (12/07/23)

Received another email

```
Hello Zakk,

Thank you for applying to the MFi Program. To help us process your application, please make the following updates and resubmit your application.


At this time, we cannot confirm if our Program Policy will allow for the type of integration you have described. However, if given access to the technical specifications, you and your team may review this information for yourself and determine your development roadmap based on that information. Please confirm your understanding of the above and we will continue reviewing your enrollment process.
You may clarify the above in the 'Additional comments' field of your enrollment form.


If you’re submitting online, sign in to the MFi Portal. You’ll be prompted to sign in with your Apple ID that uses an email associated with your company's website domain. If your application doesn't include a requested update, processing may be delayed.

MFi Program Team
```

# Response (12/07/23)

```markdown
Hello MFi team. 

This response is in reponse to your second request to modify our application. 

>  At this time, we cannot confirm if our Program Policy will allow 
>  for the type of integration you have described. However, 
>  if given access to the technical specifications,
>  you and your team may review this information for yourself and 
>  determine your development roadmap based on that information. 
>  Please confirm your understanding of the above and we will 
>  continue reviewing your enrollment process.

This sounds like an agreeable step. You grant us access to the technical specs / documentation. We review. We clarify if/how MFi is applicable to our goals and define a more detailed roadmap. 

Let us proceed. 

Thanks
-Zakk
```


# Dec 8, 2023

I received acceptance email, request to sign docs, then a welcome email. 
```

Hello Zakk,

Your company's MFi License #[ MFi-23-076708 ] has been executed, and you're now a member of the MFi Program.

The MFi Portal is your gateway to membership resources. To access your account, sign in with the Apple ID you used to submit your application. Get started by reviewing the MFi Licensing Handbook.


MFi Program Team
```


https://mfi.apple.com/content/mfidocs/search.html