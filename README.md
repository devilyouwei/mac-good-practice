<h1 style="font-size:35px; line-height:35px">
  <img width="30px" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apple/apple-original.svg" />
  MacOS Best Practices
</h1>

## Homebrew

The first step is to install **Homebrew**.

Find Homebrew here: <https://brew.sh>

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install some useful terminal utilities:

```bash
brew install curl wget git gcc tmux bottom neovim zsh fish ncdu fastfetch pfetch
```

I strongly recommend to install Rust dev tools:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Coreutils

Want to use a different version of **coreutils** instead of the default BSD ones? See
[this guide](./coreutils-intro.md).

## Nerd Fonts

Recommended Nerd font sources:

- <https://github.com/devilyouwei/linux-font> (**DO NOT** use for commercial purposes)
- <https://github.com/ryanoasis/nerd-fonts> (all-in-one Nerd Fonts)

Download and move all the fonts to `~/Library/Fonts/`.

## Zsh

**Zsh** is much more user-friendly than the default **bash** shell.

### Installation

```bash
brew install zsh
```

### Oh My Zsh

**Oh My Zsh** significantly improves the Zsh experience: <https://ohmyz.sh>

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Add the **Powerlevel10k** theme to Zsh:

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Edit your `~/.zshrc`:

```ini
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Then configure with:

```bash
p10k configure
```

### Plugins

Add **zsh-autosuggestions** and **zsh-syntax-highlighting** plugins:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then add the plugins in your `~/.zshrc`:

```ini
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
```

Install a better `ls` command, **`lsd`**:

```bash
brew install lsd
```

Initialize conda in Zsh:

```bash
conda init
```

See my **`.zshrc` config [here](./.zshrc)**

### NeoVim/Vim/Vi

A good `vimrc` is available here: <https://github.com/devilyouwei/NVimmer>

## Developers

### Python Development

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
chmod +x ./Miniconda3-latest-MacOSX-arm64.sh

./Miniconda3-latest-MacOSX-arm64.sh

conda init
```

**For NeoVim:**

```bash
pip install pynvim
```

### Node.js (TypeScript/JavaScript) Development

See the instructions here: <https://github.com/nvm-sh/nvm>

I also recommend `yarn`:

```bash
npm install -g yarn
```

**For NeoVim:**

```bash
npm install -g neovim
```

## Other

### 🐟 Fish Shell

Install the Fish shell:

```bash
brew install fish
```

Install Fisher (a Fish plugin manager):

```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Recommended theme **bobthefish**:

```bash
fisher install oh-my-fish/theme-bobthefish
```

For nvm nodejs:

```bash
fisher install jorgebucaran/nvm.fish
```

For conda python:

```bash
conda init fish
```

See my Fish config: [`~/.config/fish/config.fish`](./config.fish)
