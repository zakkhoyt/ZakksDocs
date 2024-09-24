

* [Apple's docs](https://support.apple.com/en-us/111094)
* [Point to Sound Library](https://www.logicprohelp.com/forums/topic/126372-quotpointquot-to-already-downloaded-logic-sound-library-on-an-external-hard-drive/#comment-723587)


```
# Preferences are stored: 
~/Library/Preferences/com.apple.logic10.plist

# The factory files are stored in the system directory
/Library/Application Support/Logic/

# Apple Loops are stored in
/Library/Audio/Apple Loops/
```





/Library/Application\ Support/Logic/EXS Factory\ Samples

# Symbolic Links

## Before Move (sound lib on mac HDD)
```sh
# Shows files installed to mac disk but not external ssd

exa -T "/Library/Application Support/Logic" > ~/temp/logic/io/exa_hdd.log
cat ~/temp/logic/io/exa_hdd.log | wc -l
#    5486

exa -T "/Volumes/T7/Library/Application Support/Logic" > ~/temp/logic/io/exa_ssd.log
# "/Volumes/T7/Library/Application Support/Logic": No such file or directory (os error 2)
cat ~/temp/logic/io/exa_ssd.log | wc -l
#       0
```


```sh
exa -T "/Library/Application Support/Logic" > ~/temp/logic/io/exa_hdd_after.log
cat ~/temp/logic/io/exa_hdd_after.log | wc -l
#   1

exa -T "/Volumes/T7/Library/Application Support/Logic" > ~/temp/logic/io/exa_ssd_after.log
cat ~/temp/logic/io/exa_ssd_after.log | wc -l
    5486
```


```sh
# LOGIC_DRIVE="$1"
LOGIC_DRIVE="/Volumes/T7/Library_nope/Application\ Support/Logic/"

# TODO: zakkhoyt - Validate $1


# Kill Logic
kill -9 $(ps aux | grep "Logic Pro" | tr -s " " | cut -d " " -f 2)

pushd /Library/Application\ Support

# Give a new dir nam to our basic samples that Logic downloads on first launch
sudo mv Logic Logic_bak

# Create a symbolic link to external drive
# ln -s "$1" "/Library/Application Support/Logic" 
sudo ln -s "/Volumes/T7/Library_nope/Application Support/Logic/" "/Library/Application Support/Logic" 

# Launch logic once more


```

```sh
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Alchemy Samples" "./Alchemy Samples"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Channel Strip Settings" "./Channel Strip Settings"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/EXS Factory Samples" "./EXS Factory Samples"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Logic Pro X Demosongs" "./Logic Pro X Demosongs"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Plug-In Settings" "./Plug-In Settings"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Project Templates" "./Project Templates"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Sampler Instruments" "./Sampler Instruments"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Samples" "./Samples"
sudo ln -s "/Volumes/T7/Library_full/Application Support/Logic/Ultrabeat Samples" "./Ultrabeat Samples"
```
