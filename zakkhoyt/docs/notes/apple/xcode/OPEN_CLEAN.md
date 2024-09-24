
https://www.gangofcoders.net/solution/how-to-get-xcode-to-not-automatically-open-previously-opened-projects/



# After force quite


Press `option + shift` when clicking on the Xcode icon in the dock. 


```
rm -rf ~/Library/Saved Application State/com.apple.dt.Xcode.savedState
open /Applications/Xcode.app
```



```
# Get pid of Xcode
ps aux | grep "/Applications/Xcode.app/Contents/MacOS/Xcode" | grep -v "grep " | awk '{print $2}'
```