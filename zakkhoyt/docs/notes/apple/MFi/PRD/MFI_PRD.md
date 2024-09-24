
# References
* [lucid](https://lucid.app/lucidchart/797866a4-ea32-403b-bd42-ba4ca3908ad9/edit?page=0_0&invitationId=inv_ed9a1a1f-3abd-487d-9b4b-7f02997b6ff3#)
* [Backup Protocol (Shelly)](https://docs.google.com/document/d/1x6CGlYEG85FxmnuVGzJGrv0DQfuOAbJn0gxHwSPUEjg/edit#heading=h.a37kluqbp94r)

# TODO:
* [ ] create a sequence diagram of BLE/registration
* [ ] create a sequence diagram of BLE/wifi/registration
* [ ] Figure out how to talk about this topic
  * [ ] problems/bottlenecks
  * [ ] solutions
  * [ ] measurements for before/after


* Vet my understanding of WAC
  * Apps
    * software
  * Accessory
    * hardware
    * firmware
* Produce infographic
  * get hotspot demo working 
    * screenshots
  * get MFi demo working 
    * Other devices?
    * Can we view those devices using `EAAccessoryManager`?
  * Piece together a presentation outline:
    * seqdiag: current (problems)
  * Next Steps
    * Order chips
    * Produce a working demo
      * Zakk / Zakk
      * Zakk / EmbeddedDev




* Talk with Aaron Henningesgard
  * give the gist about what I foudn
* Meeting with Staurt/Marcus options/





<img src="https://github.com/hatch-baby/HatchSleep-iOS/assets/2229408/471f02a6-0d2a-47bd-abed-45d777200e18" width="50%">

<img src="" width="50%">

<img src="" width="50%">



```
![Finder_20231125142645@2x](
  
```



# Presentation Prep
## TODO
* Explain the problem that I'm trying to solve, and how it can potentially apply to other areas
  * What we solve
  * What we dont' solve
* Create Sequence Diagrams
  * Registration (as is)
  * Registration (as it could be)
* Extrapolating
  * Doesn't need to be Websockets, or no seccurity


## Quesions/Research
* [ ] BLE speed tranfer benchmarks
* [ ] Websockets speed tranfer benchmarks
* [ ] MFI & Android
* [ ] Will Hotspot permission prompt be shown everytime or once?
* [ ] Will local network prompt be shown everytime or once?
* [ ] (shelly) Can we join/use Hotspot at will when device offline or internet down?
* [ ] Network limitation (firewall, homekit firewall, etc...)



Just going to note here: I've been researching a problem similar to that of this meeting, but focused specifically for registration (Wifi and Cert transfer step). There could maybe be some overlap with the goals of this meeting. 

For our future products Apple's MFi's WAC (Wireless Accessory Configratation) but does require a chip. For existing products  we can do most of the same without the chip, sans quietly grabbing the user's WiFi credentials. TLDR these are based on WiFi/Bonjour and have a much higher bandwidth vs BLE, but also a different set of drawbacks.  

Again this is intended to solve a different problem, but there could be some overlap if we want to consider something on top of BLE