

# How to Edit
## Target -> Info (tab)
* You can add keys/values here. 
  
## Info.plist (File)
* When adding certain key/value pairs to the `Info` tab (above), some pairs will appear in the same tab
* Others will be written to an `Info.plist` file (file created if not exist). This results in data being defined in multiple locations. 
  * One such example is `UIFileSharingEnabled`. 

## Build Settings
  
* Look in `Project` and/or `Target` Build Settings. 
* Filter for `INFOPLIST_KEY_`
* You fill find not only all of the key/values set from the two methos above, but many *possible* keys to fill in. 
* I think that if you add a key/value pair to the Info tab and that key does not exist in this filter, that's when `Info.plist` overlow occurs.