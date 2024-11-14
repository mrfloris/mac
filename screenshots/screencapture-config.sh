#!/bin/bash
# @Filename: screencapture-config.sh
# @Version: 0.0.1, build 001 for macOS 15.1+
# @Release: November 14th, 2024
# @Description: Helps me quickly set some screencapture defaults on a new machine
# @Contact: I am @floris on Twitter, and mrfloris on gmail.
# @Discord: @mrfloris on https://discord.gg/floris
# @Install: chmod a+x screencapture-config.sh
# @Syntax: ./screencapture-config.sh (will show help)
# @URL: Latest source, wiki, & support: https://github.com/mrfloris/mac/tree/main/screenshots

### todo
# - make script dynamic
# - maybe add a sleep delay
# - update script to ask upon execution what preferences we want
# - merge version 1 and 2 together
# - add startup params so we can just run the script

# Change Screenshot Save Location
defaults write com.apple.screencapture location -string "~/Desktop/Screenshots"

# Remove Shadows from Window Screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Customize the Screenshot File Name Prefix
defaults write com.apple.screencapture name "screenshot-"

# Disable Screenshot Thumbnails (for Faster Captures)
defaults write com.apple.screencapture show-thumbnail -bool false

# Change Screenshot File Format
defaults write com.apple.screencapture type -string "png"

# Add a Custom Capture Delay
defaults write com.apple.screencapture delay -int 2

# Capture the Mouse Cursor in Screenshots
defaults write com.apple.screencapture include-cursor -bool false

# Make Backgrounds Transparent for Shadows
defaults write com.apple.screencapture disable-shadow-background -bool true

# Restart SystemUIServer
killall SystemUIServer

echo "Screenshot preferences applied successfully!"

#EOF Copyright (c) 1977-2024 - Floris Fiedeldij Dop - https://mrfloris.com