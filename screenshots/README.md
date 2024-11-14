# macOS screenshots

I like things a certain way, and this helps me make sure that I understand what is possible, and how I want it. And this way I can have the same set-up on each mac system that I have.

**Note:** If you make any changes, restart the service (#9) and if you regret your changes you can reset to default again too (#10).

# Manual screenshot settings (explained)

macOS screenshot tips and tricks, for 15.1 and newer, tested on Apple Silicon M1, M2Pro, M4Pro, M4Max.

These commands allow you to modify the default settings for screenshots, making them easier to manage and improving productivity. Or, scroll down and use the shell script!

## 1. Change Screenshot Save Location

## 2. Remove Shadows from Window Screenshots

## 3. Customize the Screenshot File Name Prefix

## 4. Disable Screenshot Thumbnails (for Faster Captures)

## 5. Change Screenshot File Format

## 6. Add a Custom Capture Delay

## 7. Capture the Mouse Cursor in Screenshots

## 8. Make Backgrounds Transparent for Shadows

## 9. Restart SystemUIServer

## 10. Reset All Screenshot Settings to Default

# Shell script

Personally, I think it's nice to have personal preferences. You can use my script which will ask you questions, you give your preferences and it will excecute those commands and reset the service for you. 

## script todo
- make a skeleton shell script
- run the prefered commands
- reset service
- make script dynamic
- maybe add a sleep delay
- update script to ask upon execution what preferences we want
- merge version 1 and 2 together
- add startup params so we can just run the script

### version
Last updated: November 14th, 2024 - version 0.0.2, build 002.