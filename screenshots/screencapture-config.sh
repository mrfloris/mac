#!/bin/bash
# @Filename: screencapture-config.sh
# @Version: 0.4.6, build 017 for macOS 15.1+
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

# Lets get started
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
    echo -e "${C}Resetting to default screenshot settings...${R}"
    defaults delete com.apple.screencapture 2>/dev/null
    defaults delete com.apple.screencaptureui 2>/dev/null
    sleep 0.1
    killall SystemUIServer
    echo -e "${C} → Settings have been reset to macOS defaults.${R}\n"
}

# Function to list current preferences
list_current_preferences() {
    echo -e "${C}Current screenshot preferences:${R}"
    defaults read com.apple.screencapture 2>/dev/null || echo "No custom preferences set."
    defaults read com.apple.screencaptureui 2>/dev/null || echo "No thumbnail expiration set."
    echo # empty line
}

# Function to prompt and read user input for each setting
prompt_user() {
    echo -e "${C}Enter your preferred screenshot settings:${R}\n"
    
    # Screenshot Save Location
    echo -e -n "${B}Enter the preferred save location ${R}[default: ${C}~/Desktop/Screeniez${R}]: ${R}"
    read save_location
    save_location=${save_location:-"$HOME/Desktop/Screeniez"}

    # Check if the path exists, and expand ~ to the full home path
    save_location_expanded=$(eval echo "$save_location")
    
    if [ ! -d "$save_location_expanded" ]; then
        echo -e "The directory '$save_location_expanded' does not exist."
        echo -e -n "${B}Would you like to create this directory? (y/n) ${R}[default: ${C}y${R}]: ${R}"
        read create_dir
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
    valid_formats_str=$(IFS=", "; echo "${valid_formats[*]}") # Join the formats into a comma-separated string

    while true; do
        echo -e -n "${B}Choose the file format${R} ${C}(${valid_formats_str}) ${R}[default: ${C}png${R}]: ${R}"
        read file_format
        file_format=${file_format:-"png"} # Default to png if no input
        
        # Check if the input is valid
        if [[ " ${valid_formats[@]} " =~ " ${file_format} " ]]; then
            break # Exit loop if input is valid
        else
            echo -e "${X}Invalid format.${Y} Please choose one of: $valid_formats_str."
        fi
    done

    # Screenshot Base Name
    echo -e -n "${B}Enter the preferred base name for screenshots ${R}[default: ${C}Screenshot-${R}]: ${R}"
    read base_name
    base_name=${base_name:-"Screenshot-"}

    # Shadows
    echo -e -n "${B}Include window shadows? ${Y}(y/n) ${R}[default: ${C}y${R}]: ${R}"
    read shadow

    # Set default value if no input is provided
    shadow=${shadow:-"y"}

    # Validate input, ensure it's only 'y' or 'n'
    while [[ "$shadow" != "y" && "$shadow" != "n" ]]; do
        echo -e -n "${B}Please enter 'y' for yes or 'n' for no: ${R}"
        read shadow
        shadow=${shadow:-"y"}  # default to 'y' if empty
    done

    # Set shadow_flag based on the input
    shadow_flag="false" # by default, shadows are included
    [ "$shadow" = "n" ] && shadow_flag="true"

    # Transparent Background for Shadows
    echo -e -n "${B}Use transparent background for shadows? ${Y}(y/n) ${R}[default: ${C}y${R}]: ${R}"
    read transparent_bg

    # Set default value if no input is provided
    transparent_bg=${transparent_bg:-"y"}

    # Validate input, ensure it's only 'y' or 'n'
    while [[ "$transparent_bg" != "y" && "$transparent_bg" != "n" ]]; do
        echo -e -n "${B}Please enter 'y' for yes or 'n' for no: ${R}"
        read transparent_bg
        transparent_bg=${transparent_bg:-"y"}  # default to 'y' if empty
    done

    # Set transparent_bg_flag based on the input
    transparent_bg_flag="true" # by default, background is transparent
    [ "$transparent_bg" = "n" ] && transparent_bg_flag="false"

    # Screenshot Delay
    echo -e -n "${B}Enter screenshot delay in seconds (0 for none) ${R}[default: ${C}0${R}]: ${R}"
    read screenshot_delay

    # Set default value if no input is provided
    screenshot_delay=${screenshot_delay:-0}

    # Validate input to ensure it's a valid integer (whole seconds)
    while ! [[ "$screenshot_delay" =~ ^[0-9]+$ ]]; do
        echo -e -n "${B}Please enter a valid integer value for screenshot delay in seconds (whole seconds only): ${R}"
        read screenshot_delay
        screenshot_delay=${screenshot_delay:-0}  # default to 0 if empty
    done

    # Print the valid screenshot delay
    echo "Screenshot delay set to: $screenshot_delay seconds."

    # Mouse Cursor
    echo -e -n "${B}Include mouse cursor in screenshots? ${Y}(y/n) ${R}[default: ${C}n${R}]: ${R}"
    read cursor

    # Set default value if no input is provided
    cursor=${cursor:-"n"}

    # Validate input, ensure it's only 'y' or 'n'
    while [[ "$cursor" != "y" && "$cursor" != "n" ]]; do
        echo -e -n "${B}Please enter 'y' for yes or 'n' for no: ${R}"
        read cursor
        cursor=${cursor:-"n"}  # default to 'n' if empty
    done

    # Set cursor_flag based on the input
    cursor_flag="false" # by default, cursor is not included
    [ "$cursor" = "y" ] && cursor_flag="true"

    # Thumbnails
    echo -e -n "${B}Show screenshot thumbnail preview? ${Y}(y/n) ${R}[default: ${C}y${R}]: ${R}"
    read thumbnail

    # Set default value if no input is provided
    thumbnail=${thumbnail:-"y"}

    # Validate input, ensure it's only 'y' or 'n'
    while [[ "$thumbnail" != "y" && "$thumbnail" != "n" ]]; do
        echo -e -n "${B}Please enter 'y' for yes or 'n' for no: ${R}"
        read thumbnail
        thumbnail=${thumbnail:-"y"}  # default to 'y' if empty
    done

    # Set thumbnail_flag based on the input
    thumbnail_flag="true" # by default, thumbnails are shown
    [ "$thumbnail" = "n" ] && thumbnail_flag="false"

    # Thumbnail Expiration Time
    echo -e -n "${B}Set thumbnail expiration time in seconds ${R}[default: ${C}12.0${R}]: ${R}"
    read thumbnail_expiration

    # Set default value if no input is provided
    thumbnail_expiration=${thumbnail_expiration:-12.0}

    # Validate input to ensure it's a valid float
    while ! [[ "$thumbnail_expiration" =~ ^[0-9]+(\.[0-9]+)?$ ]]; do
        echo -e -n "${B}Please enter a valid numeric value (float) for thumbnail expiration time in seconds: ${R}"
        read thumbnail_expiration
        thumbnail_expiration=${thumbnail_expiration:-12.0}  # default to 12.0 if empty
    done

    # Ensure it's in float format (e.g., 12 -> 12.0)
    thumbnail_expiration=$(printf "%.1f" "$thumbnail_expiration")

    # Print the valid thumbnail expiration time
    echo "Thumbnail expiration time set to: $thumbnail_expiration seconds."

}

# Function to display the selected preferences
display_selections() {
    echo -e "\n${C}Your selected screenshot preferences:${R}"
    echo -e "→ ${R}Save Location:${Y} $save_location ${R}"
    echo -e "→ ${R}File Format:${Y} $file_format ${R}"
    echo -e "→ ${R}Screenshot Base Name:${Y} $base_name ${R}"
    echo -e "→ ${R}Include Window Shadows:${Y} $shadow ${R}"
    echo -e "→ ${R}Transparent Background for Shadows:${Y} $transparent_bg ${R}"
    echo -e "→ ${R}Screenshot Delay:${Y} $screenshot_delay ${R}seconds ${R}"
    echo -e "→ ${R}Include Mouse Cursor:${Y} $cursor ${R}"
    echo -e "→ ${R}Show Thumbnail Preview:${Y} $thumbnail ${R}"
    echo -e "→ ${R}Thumbnail Expiration Time:${Y} $thumbnail_expiration ${R}seconds ${R}"
}

# Function to apply preferences based on user input
apply_preferences() {
    echo -e "\n${C}Applying your preferences...${R}"

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
    echo -e "${Y}Preferences applied and SystemUIServer restarted.${R}\n"
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
        # Using echo -n to print the prompt with colors
		echo -n -e "${W}${B}Ready to apply these settings? ${R}${Y}(y/n)${R} [default: ${C}y${R}]: "
		# Use read to capture user input, defaulting to 'y' if the user presses enter without typing
		read confirm
		confirm=${confirm:-"y"}  # Default to 'y' if no input

        confirm=${confirm:-"y"}
        if [ "$confirm" = "y" ]; then
            apply_preferences
        else
            echo -e "${X}Settings were not applied.${R}"
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
        echo -e "${X}Invalid option! ${R}${W}Try: ${C}"$0" -ask${R} to get started. \n"
        exit 1
        ;;
esac


# DEBUG (quickly print out the settings, so we can double check)
list_current_preferences
#EOF Copyright (c) 1977-2024 - Floris Fiedeldij Dop - https://mrfloris.com