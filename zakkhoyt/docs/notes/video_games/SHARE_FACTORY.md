

I could not find a current online manual so instead captured some text form the PS5 manual.  The table of contents uses page numbers from the PS5 manual. See Screenshots [here](/Users/zakkhoyt/Documents/Images/screenshots/ShareFactory)

- [77 Media Formats (USB / Paths)](#77-media-formats-usb--paths)
- [78 Media Formats (Video)](#78-media-formats-video)
  - [Formats / Resolutions](#formats--resolutions)
  - [Bitrates](#bitrates)
  - [Encoding](#encoding)
- [79 Music](#79-music)
  - [Formats:](#formats)
  - [Bitrate](#bitrate)
- [80 Images](#80-images)
  - [Formats](#formats-1)
  - [Color Format:](#color-format)
  - [Resolutions](#resolutions)
- [81 Sounds](#81-sounds)
  - [Duration requirements](#duration-requirements)
  - [Format](#format)



# 77 Media Formats (USB / Paths)

It is possible to import Music, Videos, Sound FX and Images from USB under these paths:
* `/SHAREFACTORY/Music`
* `/SHAREFACTORY/Videos`
* `/ISHAREFACTORY/Images`
* `/SHAREFACTORY/Sounds`

Share Factory Studio can only read from one connected USB drive.


# 78 Media Formats (Video)

* Imported videos will be added to your Media Gallery. Be sure you have enough disk space before importing.
* Videos must use progressive scan.
* 1 second to 60 minute duration.

* For best results, a `1:1` (square pixel) sample aspect ratio is preferred


## Formats / Resolutions
* `mp4`, `m4v`, `mov`: `64x64` - `1920x1080` 
* `webm`: `3840x2160`

## Bitrates
* `h.264`: Maximum `62.5 MBPS`

## Encoding
* `h.264`
  * Color space: `bt.709`.
  * Pixel format: `yuv 4:2:0`
* `vp9` 
  * Color space: `bt.709`, `bt.2020` (referred to as `hdr`).
  * Pixel format: `yuv 4:2:0`

If you receive a "Video or Audio format is not supported" please verify that the file uses the correct encoding.

# 79 Music

Total Budget: 500 MB

## Formats:
* `mp3`
* `mp4`
* `m4a`
* `aac`
* `ogg`
* `amr`
* `3gp`
* `3gp2`

## Bitrate
* `64 KBPS` - `320 KBPS`
* Recommended: Constant `320 KBPS`

You can also organize your music into a set of subdirectories within the `/SHAREFACTORY/Music/ folder. EX:
/SHAREFACTORY/Music/folder1/music1.mp3
ISHAREFACTORY/Music/folder2/music2.mp3

If you receive a "Video or Audio format is not supported" please verify that the file uses the correct encoding.


# 80 Images
Total Budget: 32 MB
## Formats
* `jpg`
* `png` 
  * supports transparency

## Color Format:
* `8 bit` - `32 bit`

## Resolutions
* `64x64` - `3840x2160`
  * Any image over `1280x720` will be scaled down for use in Share Factory Studio.


You can also organize your images into a set of subdirectories within the `/SHAREFACTORY/Images/` folder. EX:
`/SHAREFACTORY/Images/folder1/image1.jpg`
`/SHAREFACTORY/Images/folder2/image2.jpg`

# 81 Sounds

Total Budget: 32 MB

## Duration requirements
* `0.5 s` - `15 s`

## Format
* `wav`

You can also organize your sound effects into a set of subdirectories within the `/SHAREFACTORY/Sounds/` folder. EX:
* `/SHAREFACTORY/Sounds/folder1/soundeffect1.wav`
* `/SHAREFACTORY/Sounds/folder2/soundeffect2.wav`


