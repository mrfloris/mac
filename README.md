# My Mac (dev) Setup

Once in a while, I get questions about how I set up my (new) Apple Mac system. This repository will allow me to start collecting that information and keep it up to date, and to point those who have these questions to it. It also helps me learn through contributions/suggestions by others. Feel free to clone and use this for yourself, if you find it handy, or clone and PR and make some useful contributions to this little project.

---

## Current System

My current system is a 2020 Apple Mac Mini M1 with a 1TB Nvme SSD, 16GB RAM, and running macOS 13.5. It serves as my daily driver, allowing me to spread my workload between it and my older 2017 iMac, which mainly runs services.

## Latest Update

- This repository's latest update is a snapshot of August 1st, 2023. 
- Version 0.1.2 (prototype), build 008.

## How does this work?

Before you go through my list, I want to clarify that this is not a step-by-step guide. Rather, it is a collection of my preferences based on my interests, which include Minecraft server management, HTML/CSS, markdown document writing, youtube watching and making, video editing, guitar/audio creation, documentation creation, and participation in existing projects. I am not a professional in any of these areas, but I find that the programs and tools I install make my daily usage of the Mac system more enjoyable and efficient.

## Contributions / Credit

I want to give credit to those who have inspired me to create this list and to those who have contributed to it. Any clone or pull request contributions will be acknowledged and included here.

---

## Prerequisites 

Before I do almost anything with a new system. I go through the basics, which helps me then quickly set up the rest.

- I make sure the system has the correct Apple ID / iCloud setup, so I have access to my iCloud files, as well as my Apps
- Then I install 1Password, so I can quickly login to services for Apple, Google, Microsoft, etc. more conveniently.

- Chrome
- FireFox

I use Safari to check things without being logged in, I use Chrome as my main browser. And I have FireFox for all the exceptions or to double-check something.

- For my sanity I get Alfred, but I will list it below as a homebrew install. 

- HomeBrew ([brew.sh](https://brew.sh/)) you can manually install this, or open Terminal.app from macOS and run:
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Homebrew is the package manager that is just super handy to quickly get a bunch of stuff installed, and updated, it helps you make your mac feel a bit more linux-ey.. if that makes sense. 

Once Homebrew is installed, we have access to accounts through 1Password again, it's time to start tweaking the system.

## Homebrew install <package>

A package, or "cask" in Homebrew is easy to manage, you can quickly install and remove any cask. 

I have made a [homebrew-casks.txt](/homebrew) file that helps you on-line install them.

About iTerm2, it's a great replacement for the default macOS Terminal.app, I have a [separate page](/terminal) about it.

- `brew install alfred` (macOS spotlight (and dock..) replacement)
- `brew install iterm2` (Terminal.app replacement: iTerm2)
- `brew install git` (note: macOS comes with git, but it might be outdated)
- `brew install keka` (7z/rar archiver)
- `brew install app-cleaner` (really actually uninstall apps)
- `brew install rectangle` (macOS visual windows management)
- `brew install insomnia` (REST/HTTP testers)
- `brew install imagemagick` (used for cli image editing)
- `brew install ffmpeg` (used for cli video editing)
- `brew install alt-tab` (macOS cmd-tab alternative)
- `brew install keepingyouawake` (give some caffeine to your mac)

## Apps

TODO: sort from high to lower priority (defn, using daily, vs, not super needed)
TODO: add urls
TODO: maybe check if some can be brew installed, i never checked)

- Discord (community)
- Sublime Text 4 (daily document editor)
- Sublime Merge  (quick non-intellij git stuff)
- IntelliJ IDEA CE (project git for java stuff)
- IINA (media player)
- OBS (twitch streamer)
- DaVinci Resolve (video editor)
- Logic Pro (audio editor)
- XCode (swift code editor)
- 1Password (password management)
- Affinity Photo / Publishing package (photo editing, and more)
- Bartender 4 (top menu bar manager)
- Blackmagic Disk Speed Test (handy tool to speed test drives)
- Notion (second brain)
- OnyX (nitpick macOS)
- Plex Media Server (media server for tv)
- Screenflick (screen recorder)
- Transmit (sftp)
- Visual Studio Code (for my other projects that aren't java)

## Java

- Java 20.0.2 via Oracle
TODO: new java.md page 
`https://download.oracle.com/java/20/latest/jdk-20_macos-aarch64_bin.tar.gz`
`/Library/Java/JavaVirtualMachines`

## Games

- Minecraft (java edition)
