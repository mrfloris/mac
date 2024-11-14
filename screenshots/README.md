# macOS screenshots

I like things a certain way, and this helps me make sure that I understand what is possible, and how I want it. And this way I can have the same set-up on each mac system that I have.

**Note:** If you make any changes, restart the service and if you regret your changes you can reset to default again too.

- todo: add an entry for restart service, and reset to system defaults

## Manual screenshot settings (explained)

macOS screenshot tips and tricks, for 15.1 and newer, tested on Apple Silicon M1, M2Pro, M4Pro, M4Max.

These commands allow you to modify the default settings for screenshots, making them easier to manage and improving productivity. Or, scroll down and use the shell script!

- todo: logic; figure out which handful of commands i usually run, their valid values for 15.1, and test them one by one, build up the shell script to include them one by one.

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
Last updated: November 14th, 2024 - version 0.0.1, build 001.