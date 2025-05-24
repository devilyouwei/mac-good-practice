# MacOS Best Practice

<svg width="60" viewBox="0 0 128 128">
<path d="M97.905 67.885c.174 18.8 16.494 25.057 16.674 25.137-.138.44-2.607 8.916-8.597 17.669-5.178 7.568-10.553 15.108-19.018 15.266-8.318.152-10.993-4.934-20.504-4.934-9.508 0-12.479 4.776-20.354 5.086-8.172.31-14.395-8.185-19.616-15.724C15.822 94.961 7.669 66.8 18.616 47.791c5.438-9.44 15.158-15.417 25.707-15.571 8.024-.153 15.598 5.398 20.503 5.398 4.902 0 14.106-6.676 23.782-5.696 4.051.169 15.421 1.636 22.722 12.324-.587.365-13.566 7.921-13.425 23.639M82.272 21.719c4.338-5.251 7.258-12.563 6.462-19.836-6.254.251-13.816 4.167-18.301 9.416-4.02 4.647-7.54 12.087-6.591 19.216 6.971.54 14.091-3.542 18.43-8.796"></path>
</svg>

## Homebrew

When I have a macbook, the first head is to install **HomeBrew**.

Homebrew: <https://brew.sh>

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install some useful utils:

```bash
brew install curl wget git tmux bottom python3 neovim
```

## Zsh

**Zsh** is better easy to use than **bash** shell.

### Install Zsh

```bash
brew install zsh
```

### Oh My Zsh

Oh my zsh make zsh better and better: <https://ohmyz.sh>

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Add **Powerlevel10k** theme to zsh

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# change ~/.zshrc

ZSH_THEME="powerlevel10k/powerlevel10k"

# config
p10k configure
```

Add **zsh-autosuggestions** and **zsh-syntax-highlighting** plugins

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# add plugins to ~/.zshrc
plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
```

Install better `ls` command: **lsd**

```bash
brew install lsd
```

## Nerd Font

Recommend nerd fonts:

- <https://github.com/devilyouwei/linux-font>
- <https://github.com/thep0y/monaco-nerd-font> Need to click **Releases**
- <https://github.com/muhac/monaco-fira-code-ligatures> Use `MonacoFiraNerd`

## My Config

See my **[zshrc](./.zshrc)**

