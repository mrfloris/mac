# macOS screenshots

I like things a certain way, and this helps me make sure that I understand what is possible, and how I want it. And this way I can have the same set-up on each mac system that I have.

**Note:** If you make any changes, restart the service (#10) and if you regret your changes you can reset to default again too (#11).

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

## 4. # Change the floating Thumbnail time
Depending on the system, the expiration with false for thumbnails might still show it, setting it to 0 will not show it and write to disk, you could always remove this, reset defaults, and run the script again. 
```
defaults write com.apple.screencaptureui thumbnailExpiration -float 12.0
```

## 5. Disable Screenshot Thumbnails (for Faster Captures)
To turn off the annoying floating thumbnail:
```bash
defaults write com.apple.screencapture show-thumbnail -bool false
```
Re-enable screenshot thumbnails again with:
```bash
defaults write com.apple.screencapture show-thumbnail -bool true
```

## 6. Change Screenshot File Format
By default, screenshots are PNG files. You can change to a different format (e.g., JPG, TIFF):
```bash
defaults write com.apple.screencapture type -string "png"
```
Supported formats include `jpg`, `png`, `pdf`, `tiff`, and `gif`. I prefer PNG, despite the filesize, because it allows me to capture full windows, with shadows and transparant backgrounds.

## 7. Add a Custom Capture Delay
Add a delay (in seconds) to screenshots:
```bash
defaults write com.apple.screencapture delay -int 5
```
Change `5` to any desired delay in seconds. I set it low, because it's so annoying that you have to wait for anything.

## 8. Capture the Mouse Cursor in Screenshots
To include the mouse cursor in screenshots:
```bash
defaults write com.apple.screencapture include-cursor -bool true
```
To exclude the cursor like I always do, set it to `false`:
```bash
defaults write com.apple.screencapture include-cursor -bool false
```

## 9. Make Backgrounds Transparent for Shadows
Ensure transparency behind window shadows, because otherwise it just looks terrible
```bash
defaults write com.apple.screencapture disable-shadow-background -bool true
```

## 10. Restart SystemUIServer
After you're done running the commands to your liking, don't forget to restart the serivce, you can do so by typing this:
```bash
killall SystemUIServer
```
Or just run the sh script!

## 11. Reset All Screenshot Settings to Default
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

https://github.com/mrfloris/mac/blob/main/screenshots/screencapture-config.sh

## Shell Script Examples and Documentation

### Prerequisite
- Be on a Mac system with macOS 15.1, that's what I've tested on. Anything higher or lower could have changes. 
- You have to `chmod a+x screencapture-config.sh` once, so you can execute it. 

### Documentation
- When you run it without any parameter, it will default to `-h`
<img width="746" alt="screenshot- 2024-11-14 at 11 45 04" src="https://github.com/user-attachments/assets/2e7676b1-224b-4818-b6cf-d06d17442da8">

---

- And feeding it the `-h` or `--help` parameters, it will show that same screen
<img width="793" alt="screenshot- 2024-11-14 at 11 45 14" src="https://github.com/user-attachments/assets/1a20a918-667d-4f3a-af28-803be68b7ce2">
<img width="774" alt="screenshot- 2024-11-14 at 11 45 22" src="https://github.com/user-attachments/assets/7fb6b937-9e0a-4914-a519-a4a9fe436116">

---

- You can review the currently set custom settings with `-list`
<img width="683" alt="Screenshot 2024-11-14 at 11 45 39" src="https://github.com/user-attachments/assets/21bd4f95-c74f-4c61-9982-55ff2f6182da">

---

- Which you don't have to clear first, it will override, but, in case you do need to troubleshoot and wish to start over, you can just use the `-reset` parameter
<img width="552" alt="Screenshot 2024-11-14 at 11 45 49" src="https://github.com/user-attachments/assets/5e050fc6-d106-4885-a9d8-b4344f147b0d">

---

- And when you're ready to start, feed it the `-ask` parameter, and you can press enter to quickly go through the defaults, or enter a custom value if you want. 
- It will prompt you first to confirm those are the changes you wish to make, control-c can always be used, but a graceful n to discontinue is possible at this stage. 
- If you select y, for yes, it will attempt to write the values to the plist preference files. 
- And then it will restart the service. The changes are live, you can use them right away. 
<img width="699" alt="Screenshot- 2024-11-14 at 11 46 21" src="https://github.com/user-attachments/assets/b793b243-554b-48c9-9478-7b6acc6844d9">

---

- There is some user-input validation, and if you point it to a custom directly it will check if it exists, if not, it will prompt you first to create it. 

## Resources
- Apple's support community surely has some existing threads with possible solutions. This page is limited to the settings I generally change when I fresh install a system. 
- Additionally, this only covers setting some default, and then i use shift+command+4+space, and deal with the screenshot manually. You can also go and run the screencapture command manually with a bunch of paramters each time you want to do a certain thing (that's out of scope for this github repo) https://ss64.com/mac/screencapture.html

### Version
Last updated: November 14th, 2024 - version 1.0.2, build 012.
