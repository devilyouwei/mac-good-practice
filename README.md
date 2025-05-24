# MacOS Best Practice

<img width="60" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apple/apple-original.svg" />

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

