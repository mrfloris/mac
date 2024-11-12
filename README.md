# My Mac (dev) Setup

Once in a while, I get questions about how I set up my (new) Apple Mac system. This repository will allow me to start collecting that information and keep it up to date, and to point those who have these questions to it. It also helps me learn through contributions/suggestions by others. Feel free to clone and use this for yourself if you find it handy, or clone and PR and make some useful contributions to this little project.

## Current System

My current system is an [Apple MacBook Pro M4Max from 2024][macmini-url] with a 2TB Nvme SSD, 64GB RAM, and running the Sequoia version of macOS. It serves as my daily driver, allowing me to spread my workload between it and 2020 M1, 2023 M2Pro, 2024 M4Pro Mac Mini's, and my older 2017 iMac, which mainly runs services.

## Latest Update

- This repository's latest update is a snapshot of November 12th, 2024.
- Version 0.2.5, build 028.

## How Does This Work?

Before you go through my list, I want to clarify that this is not a step-by-step guide. Instead, it is a collection of my preferences based on my interests, which include Minecraft server management, HTML/CSS, markdown document writing, YouTube watching and making, video editing, guitar/audio creation, documentation creation, and participation in existing projects. I am not a professional in any of these areas, but the programs and tools I install make my daily usage of the Mac system more enjoyable and efficient.

## Contributions / Credit

I want to credit those who have inspired me to create this list and those who have contributed to it. Any clone or pull request contributions you'll be acknowledged and included here.

Thank you, @the456gamer, for your contributions!

---

## Prerequisites

Before I do almost anything with a new system, I go through the basics, which helps me then quickly set up the rest.

I make sure the system has the correct Apple ID / iCloud setup so I have access to my iCloud files and Apps.
- Then I install 1Password to quickly log in to services for Apple, Google, Microsoft, etc., more conveniently.

- Chrome
- Firefox

I use Safari to check things without being logged in, I use Chrome as my main browser, and I have Firefox for all the exceptions or to double-check something.

- For my sanity, I get Alfred, but I will list it below as a Homebrew install.

- Before doing much more, I run `xcode-select --install` in the command line.

- [Homebrew][homebrew-url]: You can manually install this or open Terminal.app from macOS and run:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Homebrew is the package manager that is super handy for quickly installing and updating a bunch of stuff. It helps you make your Mac feel a bit more Linux-ey if that makes sense.

Once Homebrew is installed, we can access accounts through 1Password again; it's time to start tweaking the system.

## Homebrew install <package>

A package, or "cask" in Homebrew, is easy to manage; you can quickly install and remove any cask.

I have made a [homebrew-casks.txt][homebrewfolder-url] file that helps you install them online.

About iTerm2, it's an excellent replacement for the default macOS Terminal.app, I have a [separate page][terminalfolder-url] about it.

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
- `brew install stats` (menubar system stats)
- `brew install itsycal` (menubar calendar)
- `brew install keepingyouawake` (give some caffeine to your Mac)

### Find Package Browser

You can search [this repository][formulae-url] for your favorite casks, formulae, apps.

## Apps

- [Discord][discord-url] (community)
- [Sublime Text 4][sublime-text-url] (daily document editor)
- [Sublime Merge][sublime-merge-url] (quick non-IntelliJ git stuff)
- [IntelliJ IDEA CE][intellij-url] (project git for Java stuff)
- [IINA][iina-url] (media player)
- [OBS][obs-url] (Twitch streamer)
- [DaVinci Resolve][davinci-resolve-url] (video editor)
- [Logic Pro][logic-pro-url] (audio editor)
- [Xcode][xcode-url] (Swift code editor)
- [1Password][1password-url] (password management)
- [Affinity Photo / Publishing package][affinity-url] (photo editing, and more)
- [Bartender 4][bartender-url] (top menu bar manager)
- [Blackmagic Disk Speed Test][disk-speed-test-url] (handy tool to speed test drives)
- [Notion][notion-url] (second brain)
- [OnyX][onyx-url] (nitpick macOS)
- [Plex Media Server][plex-url] (media server for TV)
- [Screenflick][screenflick-url] (screen recorder)
- [Transmit][transmit-url] (SFTP)
- [Visual Studio Code][vs-code-url] (for my other projects that aren't Java)
- [BetterDisplay Pro](https://github.com/waydabber/BetterDisplay#readme) Better Display Manager for macOS

## Java

- [Java 22.0.2 via Oracle][java-url]

## Games

- Minecraft (Launcher for Java edition).

## Dock

- I don't use the Dock much. I auto-hide the Dock, and I have it vertically on the left. I use Alfred and Finder to do most things. It's also recommended to just remove the tools you really won't be using daily. And to start dragging some opened tools that you do use daily into the Dock. 

## TODO

- nodejs
- docker
- tmux info
- handy links like shell checker and YAML compliance checker, chatgpt, code beautifier 
- steam (Zrips helped me remind me)
- ? your suggestions?
- Mikey's dotfiles https://github.com/madmikeyb/dotfiles

- the456gamer contributions:

I had some time to kill, so I found the cask/formulae versions for the apps not on there
```
brew install --cask alfred
brew install --cask iterm2
brew install git
brew install --cask keka
brew install --cask app-cleaner
brew install --cask rectangle
brew install --cask insomnia
brew install imagemagick
brew install ffmpeg
brew install --cask alt-tab
brew install --cask stats
brew install --cask itsycal
brew install --cask keepingyouawake

brew install --cask discord
brew install --cask sublime-text
brew install --cask sublime-merge
brew install --cask jetbrains-toolbox
brew install --cask iina
brew install --cask obs
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask affinity-photo
brew install --cask affinity-publisher
brew install --cask bartender
brew install --cask notion
brew install --cask onyx
brew install --cask plex-media-server
brew install --cask screenflick
brew install --cask transmit
brew install --cask visual-studio-code
brew install --cask minecraft
brew install --cask docker # DOCKER DESKTOP OR
brew install docker        # DOCKER OSS
brew install --cask oracle-jdk # "oracle JDK 20.0.2" OR (probably)
brew install openjdk@<ver> # java open source versions, ver = 20,17,11,8 https://medium.com/@manvendrapsingh/installing-many-jdk-versions-on-macos-dfc177bc8c2b

brew install tmux
```
the only 4 I was unable to find were
<https://www.blackmagicdesign.com/products/davinciresolve/>
<https://www.apple.com/logic-pro/>
<https://developer.apple.com/xcode/>
<https://apps.apple.com/gb/app/blackmagic-disk-speed-test/id425264550?mt=12>

I will have to review all this ^ when I have time. but now I at least have this.

- TODO: sort the apps list from high to lower priority (defn, using daily, vs, not super needed)
- TODO: maybe check if some apps can be brew installed, I never checked, update: the456 checked, see above)

- TODO: github stuff so sublime merge works
- TODO: omz https://github.com/ohmyzsh/ohmyzsh/wiki
- TODO: p10k `brew install powerlevel10k` https://github.com/romkatv/powerlevel10k
- todo : java22 https://jdk.java.net/archive/

---

[homebrew-url]: https://brew.sh/
[formulae-url]: https://formulae.brew.sh/
[discord-url]: https://discord.com/
[sublime-text-url]: https://www.sublimetext.com/
[sublime-merge-url]: https://www.sublimemerge.com/
[intellij-url]: https://www.jetbrains.com/idea/
[iina-url]: https://iina.io/
[obs-url]: https://obsproject.com/
[davinci-resolve-url]: https://www.blackmagicdesign.com/products/davinciresolve/
[logic-pro-url]: https://www.apple.com/logic-pro/
[xcode-url]: https://developer.apple.com/xcode/
[1password-url]: https://1password.com/
[affinity-url]: https://affinity.serif.com/
[bartender-url]: https://www.macbartender.com/
[disk-speed-test-url]: https://www.blackmagicdesign.com/products/blackmagicdiskspeedtest/
[notion-url]: https://www.notion.so/
[onyx-url]: https://www.titanium-software.fr/en/onyx.html
[plex-url]: https://www.plex.tv/
[screenflick-url]: https://www.araelium.com/screenflick-mac-screen-recorder
[transmit-url]: https://panic.com/transmit/
[vs-code-url]: https://code.visualstudio.com/
[java-url]: /java
[homebrewfolder-url]: /homebrew
[terminalfolder-url]: /terminal
[macmini-url]: https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-m4-max-16-core-cpu-40-core-gpu-16-2024-specs.html
