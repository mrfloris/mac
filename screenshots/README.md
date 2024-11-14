# macOS screenshots

I like things a certain way, and this helps me make sure that I understand what is possible, and how I want it. And this way I can have the same set-up on each mac system that I have.

**Note:** If you make any changes, restart the service (#9) and if you regret your changes you can reset to default again too (#10).

# Manual screenshot settings (explained)

macOS screenshot tips and tricks, for 15.1 and newer, tested on Apple Silicon M1, M2Pro, M4Pro, M4Max.

These commands allow you to modify the default settings for screenshots, making them easier to manage and improving productivity. Or, scroll down and use the shell script!

## 1. Change Screenshot Save Location
By default, screenshots save to the desktop. Change this to another folder:
```bash
defaults write com.apple.screencapture location -string "~/Desktop/Screenshots"
```
Replace `~/Desktop/Screenshots` with the desired path. (Reset to default with `~/Desktop`)

## 2. Remove Shadows from Window Screenshots
Shadows around windows add context but can look weird. You can disable them:
```bash
defaults write com.apple.screencapture disable-shadow -bool true
```
Or make sure they're enabled:
```bash
defaults write com.apple.screencapture disable-shadow -bool false
```

## 3. Customize the Screenshot File Name Prefix
Modify the prefix of the screenshot files:
```bash
defaults write com.apple.screencapture name "screenshot-"
```
Replace `"screenshot-"` with the text you’d like.

## 4. Disable Screenshot Thumbnails (for Faster Captures)
To turn off the annoying floating thumbnail:
```bash
defaults write com.apple.screencapture show-thumbnail -bool false
```
Re-enable screenshot thumbnails again with:
```bash
defaults write com.apple.screencapture show-thumbnail -bool true
```

## 5. Change Screenshot File Format
By default, screenshots are PNG files. You can change to a different format (e.g., JPG, TIFF):
```bash
defaults write com.apple.screencapture type -string "png"
```
Supported formats include `jpg`, `png`, `pdf`, `tiff`, and `gif`. I prefer PNG, despite the filesize, because it allows me to capture full windows, with shadows and transparant backgrounds.

## 6. Add a Custom Capture Delay
Add a delay (in seconds) to screenshots:
```bash
defaults write com.apple.screencapture delay -int 5
```
Change `5` to any desired delay in seconds. I set it low, because it's so annoying that you have to wait for anything.

## 7. Capture the Mouse Cursor in Screenshots
To include the mouse cursor in screenshots:
```bash
defaults write com.apple.screencapture include-cursor -bool true
```
To exclude the cursor like I always do, set it to `false`:
```bash
defaults write com.apple.screencapture include-cursor -bool false
```

## 8. Make Backgrounds Transparent for Shadows
Ensure transparency behind window shadows, because otherwise it just looks terrible
```bash
defaults write com.apple.screencapture disable-shadow-background -bool true
```

## 9. Restart SystemUIServer
After you're done running the commands to your liking, don't forget to restart the serivce, you can do so by typing this:
```bash
killall SystemUIServer
```
Or just run the sh script!

## 10. Reset All Screenshot Settings to Default
**Method 1**, another command!
If you want to revert to macOS's default screenshot settings:
```bash
defaults delete com.apple.screencapture
```
**Method 2**, the above, but ..
by running the shell script with the `-reset` parameter.
**Method 3**, deleting the .plist file manually, you can find it here:
```
~/Library/Preferences/com.apple.screencapture.plist
~/Library/Preferences/com.apple.screencaptureui.plist (optional)
```

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

## Resources
- Apple's support community surely has some existing threads with possible solutions. This page is limited to the settings I generally change when I fresh install a system. 
- Additionally, this only covers setting some default, and then i use shift+command+4+space, and deal with the screenshot manually. You can also go and run the screencapture command manually with a bunch of paramters each time you want to do a certain thing (that's out of scope for this github repo) https://ss64.com/mac/screencapture.html

### version
Last updated: November 14th, 2024 - version 0.1.3, build 006.