# Terminal (shell)

Future page for shell replacement iTerm2, Oh My Shell (https://ohmyz.sh/), and my preferences/settings. And to remind myself, tmux. 

## brew
```
brew install iterm2
```

## github / sublime merge
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
```
ssh-keygen -t ed25519 -C "mrfloris@gmail.com"
```
```
ls -al ~/.ssh
ssh-add
eval "$(ssh-agent -s)"
```
```
sudo nano -w ~/.ssh/config
```
```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```
```
brew install gh
```
```
gh auth login
ssh -> browser
```
```
pbcopy < ~/.ssh/id_ed25519.pub
```
```
ssh -T git@github.com
(say yes to fingerprinting)
```

## Fonts
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

open iTerm2:
- Preferences → General → Closing→ Quit confirm
- Preferences → Profiles → Text and set Font to MesloLGS NF
- Preferences → Profiles → Window and set size to 160 x 45, font 14+ and 'maximized'
- Shell integration, turn it on


## OMZ

https://github.com/ohmyzsh/ohmyzsh/wiki
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

nano $HOME/.zshrc
plugins=(alias-finder brew common-aliases copypath copyfile docker encode64 git history jsontools macos web-search z)
```

### plugins
- Auto update: https://github.com/TamCore/autoupdate-oh-my-zsh-plugins
```
mkdir $ZSH_CUSTOM/plugins/autoupdate
cd 
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
cd $ZSH_CUSTOM/plugins/autoupdate
ls -all (to confirm)
nano $HOME/.zshrc
(append) plugins=(autoupdate)
```
- Syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
```
brew install zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
nano $HOME/.zshrc
(append) plugins=(zsh-syntax-highlighting)
```
- Auto suggestions: https://github.com/zsh-users/zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
nano $HOME/.zshrc
(append) plugins=(zsh-autosuggestions)
```
- History sub-string search: 
```
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
nano $HOME/.zshrc
(append) plugins=(zsh-history-substring-search)
```

### more info
https://dev.to/rannn505/macos-awesome-terminal-519n

## Powerlevel10k
https://github.com/romkatv/powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

# restart iTerm2
`p10k configure` will start, or start it
