#!/bin/bash
# @Filename: screencapture-config.sh
# @Version: 0.4.3, build 014 for macOS 15.1+
# @Release: November 14th, 2024
# @Description: Helps me quickly set some screencapture defaults on a new machine
# @Contact: I am @floris on Twitter, and mrfloris on gmail.
# @Discord: @mrfloris on https://discord.gg/floris
# @Install: chmod a+x screencapture-config.sh
# @Syntax: ./screencapture-config.sh (will show help)
# @URL: Latest source, wiki, & support: https://github.com/mrfloris/mac/tree/main/screenshots

### todo
# - known issue; user input type could be a mismatch

# theme
B="\033[1m"; Y="\033[33m"; C="\033[36m"; X="\033[91m"; R="\033[0m"; W="\033[97m"
echo -e "debug: ${B}testB${R} , ${Y}testY${R} , ${C}testC${R} , ${X}testX${R}, ${R}testR, test"
echo -e "\n${B}${Y}Welcome to the macOS screencapture Customizer${R}\n"

# Function to display help
show_help() {
    echo -e "${W}Usage: ${B}screencapture-config.sh${R} ${C}[OPTION]${R}"
    echo
    echo "Options:"
    echo -e "  ${C}-h, --help${R}    Show this help message"
    echo -e "  ${C}-ask${R}          Ask questions to customize screenshot settings interactively"
    echo -e "  ${C}-reset${R}        Reset screenshot settings to macOS defaults"
    echo -e "  ${C}-list${R}         Display current screenshot settings without making changes \n"
}

# Function to reset to default screenshot settings
reset_preferences() {
    echo "Resetting to default screenshot settings..."
    defaults delete com.apple.screencapture
    defaults delete com.apple.screencaptureui
    sleep 0.1
    killall SystemUIServer
    echo "Settings have been reset to macOS defaults."
}

# Function to list current preferences
list_current_preferences() {
    echo -e "\nCurrent screenshot preferences:"
    defaults read com.apple.screencapture 2>/dev/null || echo "No custom preferences set."
    defaults read com.apple.screencaptureui 2>/dev/null || echo "No thumbnail expiration set."
}

# Function to prompt and read user input for each setting
prompt_user() {
    echo -e "Enter your preferred screenshot settings:\n"
    
    # Screenshot Save Location
    read -p "Enter the preferred save location (default: ~/Desktop/Screeniez): " save_location
    save_location=${save_location:-"$HOME/Desktop/Screeniez"}

    # Check if the path exists, and expand ~ to the full home path
    save_location_expanded=$(eval echo "$save_location")
    
    if [ ! -d "$save_location_expanded" ]; then
        echo "The directory '$save_location_expanded' does not exist."
        read -p "Would you like to create this directory? (y/n) [default: y]: " create_dir
        create_dir=${create_dir:-"y"}
        
        if [ "$create_dir" = "y" ]; then
            mkdir -p "$save_location_expanded" 2>/dev/null
            if [ $? -ne 0 ]; then
                echo "Failed to create the directory '$save_location_expanded'. Exiting script."
                exit 1
            fi
            echo "Directory '$save_location_expanded' created."
        else
            echo "Directory creation was declined. Exiting script."
            exit 1
        fi
    fi

    # File Format (with validation)
    valid_formats=("png" "jpg" "pdf" "tiff" "gif")
    valid_formats_str=$(IFS=", "; echo "${valid_formats[*]}")  # Join the formats into a comma-separated string

    while true; do
        read -p "Choose the file format ($valid_formats_str) [default: png]: " file_format
        file_format=${file_format:-"png"}  # Default to png if no input
        
        # Check if the input is valid
        if [[ " ${valid_formats[@]} " =~ " ${file_format} " ]]; then
            break  # Exit loop if input is valid
        else
            echo "Invalid format. Please choose one of: $valid_formats_str."
        fi
    done

    # Screenshot Base Name
    read -p "Enter the preferred base name for screenshots (default: screenshot-): " base_name
    base_name=${base_name:-"screenshot-"}

    # Shadows
    read -p "Include window shadows? (y/n) [default: y]: " shadow
    shadow=${shadow:-"y"}
    shadow_flag="false" # by default, shadows are included
    [ "$shadow" = "n" ] && shadow_flag="true"

    # Transparent Background for Shadows
    read -p "Use transparent background for shadows? (y/n) [default: y]: " transparent_bg
    transparent_bg=${transparent_bg:-"y"}
    transparent_bg_flag="true" # by default, background is transparent
    [ "$transparent_bg" = "n" ] && transparent_bg_flag="false"

    # Screenshot Delay
    read -p "Enter screenshot delay in seconds (0 for none) [default: 0]: " screenshot_delay
    screenshot_delay=${screenshot_delay:-0}

    # Mouse Cursor
    read -p "Include mouse cursor in screenshots? (y/n) [default: n]: " cursor
    cursor=${cursor:-"n"}
    cursor_flag="false" # by default, cursor is not included
    [ "$cursor" = "y" ] && cursor_flag="true"

    # Thumbnails
    read -p "Show screenshot thumbnail preview? (y/n) [default: y]: " thumbnail
    thumbnail=${thumbnail:-"y"}
    thumbnail_flag="true" # by default, thumbnails are shown
    [ "$thumbnail" = "n" ] && thumbnail_flag="false"

    # Thumbnail Expiration Time
    read -p "Set thumbnail expiration time in seconds [default: 12.0]: " thumbnail_expiration
    thumbnail_expiration=${thumbnail_expiration:-12.0}
}

# Function to display the selected preferences
display_selections() {
    echo -e "\nYour selected screenshot preferences:"
    echo "Save Location: $save_location"
    echo "File Format: $file_format"
    echo "Screenshot Base Name: $base_name"
    echo "Include Window Shadows: $shadow"
    echo "Transparent Background for Shadows: $transparent_bg"
    echo "Screenshot Delay: $screenshot_delay seconds"
    echo "Include Mouse Cursor: $cursor"
    echo "Show Thumbnail Preview: $thumbnail"
    echo "Thumbnail Expiration Time: $thumbnail_expiration seconds"
}

# Function to apply preferences based on user input
apply_preferences() {
    echo -e "\nApplying your preferences..."

    # Set the screenshot save location
    commands=(
        "defaults write com.apple.screencapture location -string \"$save_location\"" # Set save location
        "defaults write com.apple.screencapture type -string \"$file_format\"" # Set file format (e.g., png, jpg)
        "defaults write com.apple.screencapture name -string \"$base_name\"" # Set base name for screenshots
        "defaults write com.apple.screencapture disable-shadow -bool $shadow_flag" # Enable/Disable shadow in screenshots
        "defaults write com.apple.screencapture disable-shadow-background -bool $transparent_bg_flag" # Enable/Disable transparent background
        "defaults write com.apple.screencapture delay -int $screenshot_delay" # Set delay before screenshot is taken
        "defaults write com.apple.screencapture include-cursor -bool $cursor_flag" # Include cursor in screenshot
        "defaults write com.apple.screencapture show-thumbnail -bool $thumbnail_flag" # Show/Hide thumbnail preview
        "defaults write com.apple.screencaptureui thumbnailExpiration -float $thumbnail_expiration" # Set thumbnail expiration time
    )

    # Execute each command with a small sleep delay between them
    for cmd in "${commands[@]}"; do
        eval "$cmd"
        sleep 0.1  # Delay between each command
    done

    # Additional sleep delay before restarting SystemUIServer
    sleep 0.1
    killall SystemUIServer
    echo "Preferences applied and SystemUIServer restarted."
}

# Main Script Execution
if [ -z "$1" ]; then
    # Default to -h if no argument is provided
    show_help
fi

case "$1" in
    -h|--help)
        show_help
        exit 0 # Ensures the script exits after displaying help
        ;;
    -ask)
        prompt_user # Gather user input
        display_selections # Show the selected settings
        read -p "Ready to apply these settings? (y/n) [default: y]: " confirm
        confirm=${confirm:-"y"}
        if [ "$confirm" = "y" ]; then
            apply_preferences
        else
            echo "Settings were not applied."
        fi
        ;;
    -reset)
        reset_preferences
        ;;
    -list)
        list_current_preferences
        exit 0 # Ensures the script exits after displaying help
        ;;
    *)
        echo -e "${X}Invalid option! ${R}${W}Try: ${C}"$0" -ask${R} to get started."
        exit 1
        ;;
esac


# DEBUG (quickly print out the settings, so we can double check)
list_current_preferences
#EOF Copyright (c) 1977-2024 - Floris Fiedeldij Dop - https://mrfloris.com