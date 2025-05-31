# GNU/BSD/Rust Coreutils 对比

🧑‍💻 在日常 Linux 或 macOS 命令行世界里，`ls`、`cp`、`mv`、`cat`
这些工具陪伴我们写脚本、管理文件、自动化一切。你可能没注意过，其实这些普通“小工具”背后，有好几个流派的实现！如果你关心脚本可移植性、写法兼容性、甚至安全和效率，这些工具的“血统”差异就得重视了。

这里来梳理下**主流 coreutils** 各自的历史、适用场景、那些微妙但关键的参数兼容性坑，最后给出安装和使用的过程。

## 主流 coreutils 都有哪些？

**Coreutils** 即“核心命令行工具箱”：基本文件操作、文本处理、查找过滤、排序统计等。

主流三大家：

- **GNU coreutils**
    - 各大 Linux、WSL、Docker、Homebrew for Mac
    - 参数最丰富、man 最详细、社区最活跃
- **BSD coreutils**
    - macOS、自家 FreeBSD/OpenBSD/NetBSD
    - 和 UNIX 传统脚本兼容性好，安全策略保守
- **Rust uutils coreutils (最新)**
    - Rust 社区重建，支持全平台，有趣又现代
    - 兼容度和完善度还在成长中

Note: 其实还有 busybox、toybox（嵌入式用）和历史文艺的 heirloom tools，但主流桌面/开发机基本都是上面仨。

## 表格对比：常用命令兼容和差异

| 工具/参数     | GNU coreutils (Linux) | BSD coreutils (macOS) |  Rust uutils coreutils  |
| ------------- | :-------------------: | :-------------------: | :---------------------: |
| `ls --color`  |           √           | ❌ （`-G` 支持上色）  |           ❌            |
| `ls -G`       |          ❌           |           √           | △（不是所有细节都齐全） |
| `cp -a`       |   √ （归档全保留）    |  △ （相当于 `-RpP`）  |            △            |
| `cp -u`       |           √           |           √           |            △            |
| `mv -n`       |           √           |     √（新版支持）     |            √            |
| `cat -n`      |           √           |           √           |            √            |
| `head -n -3`  |           √           |          ❌           |           ❌            |
| `sort -V`     |           √           |          ❌           |            △            |
| `sed -i`      |    √（直接 `-i`）     |     必须 `-i ''`      |    △（覆盖行为有限）    |
| `sed -E`      |          ❌           |     √（扩展正则）     |            √            |
| `date -d`     |           √           | ❌（用 `-j -f` 替代） |           ❌            |
| `find -iname` |           √           |           √           |            √            |
| `xargs -0`    |           √           |           √           |            √            |

> 说明：√ = 完全支持，△ = 部分支持或有差别，❌ = 不支持/行为明显不同  
> 其它未列举的参数，建议参考各自 man 文档或实际执行 `--help/ man`。

## 为什么有这么多不同？

这是历史与生态的选择：

- **GNU coreutils** 追求功能丰富和效率，疯狂加长参数（例如 --color、--human-readable），开源社区贡献度高。这让 Linux
  shell 脚本的表达力和易用度都很亮眼。
- **BSD coreutils**
  长于坚守传统和安全，兼容古老 UNIX 系统的脚本，对参数行为更保守，很注重稳定性和一致性。这也是 macOS 的默认选择。
- **Rust uutils**
  是极客重写的“新瓶装旧酒”，以便跨平台和安全，有些命令还没赶上前两者的细节，但天生支持现代开发新需求和多操作系统一致体验。

## 为什么日常你没注意到差别？

其实大多数 `ls -l`、`cp xxx yyy`、`cat file` 这类最常用参数是“大家约定俗成的统一标准”，脚本兼容 Windows
WSL、macOS、Ubuntu 都毫无问题。

只有到进阶参数、多文件批量、正则/日期等细节场景，BSD/GNU 差别才会暴露：

- 参数不兼容（如 `ls --color`、`sed -i`、`date -d`）
- 部分行为不同（如 `head` 负数行、二进制文件处理、字符集 locale 支持）

## 脚本写法上的建议

1. **如果只在 macOS 上用——无脑 BSD 参数，参照 BSD/man 文档。**
2. **如果要写跨平台脚本——保持用最基础的参数组合。**
    - 避免 `ls --color`，用 `ls` 或 `ls -G`。
    - `sed -i''` 写法保持 BSD/GNU 双兼容。
3. **如果你是 Linux + Mac 混用党，推荐装 Homebrew GNU coreutils 备用，用 `gcp` / `gls` 支持更多花式参数。**
4. **追求极致安全/跨平台新玩意儿？不妨试试 Rust uutils，但别完全依赖高阶参数。**

## 别让系统 PATH 搞混搭

有时候装了 brew coreutils、Rust uutils，多出来的 `gls`、`uls`、`ls` 并存。此时 PATH 顺序很重要。脚本调试前，务必用

```bash
which ls
ls --version
```

确认到底用的哪一套！不然参数不支持、脚本出错，根源都找不到。

当然，以下继续采用技术博客风格，系统介绍**macOS、Linux、Windows 平台如何安装和使用 GNU coreutils、BSD coreutils 和 Rust
uutils coreutils**，并给出实用建议和必备配置方法。

## 各种系统尝试各种 coreutils

不同平台出厂自带的 coreutils 实现各异——但其实只要会“下包”，三种流派你都可以尝鲜！下面分别介绍 macOS / Linux /

Windows 上，各家 coreutils 的安装方法、环境变量设置要点和易踩的坑。

### MacOS

#### BSD coreutils（系统自带）

Mac 的 `/bin/ls`、`/bin/cp`、`/bin/mv`、`/usr/bin/*` 就是 BSD 系，无需安装。

检测（BSD 版 ls 没 --version）：

```sh
ls --version
# 报错 "ls: illegal option -- -" 即为 BSD 版
```

#### GNU coreutils（Homebrew 安装）

```sh
brew install coreutils
```

安装后所有工具增加 `g` 前缀（如 `gls`, `gcp`, `gmv`）。

检查版本：

```sh
gls --version
```

要让 **GNU/coreutils** 覆盖系统的BSD版，可以修改`shell`配置，例如`~/.zshrc`：

```sh
# Apple Intel
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Apple Silicon
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
```

#### Rust uutils coreutils

**1. 用 Rust 包管理器 `Cargo` 安装**

```sh
# 可能需要先输入这个配置命令的前置命令
export PROJECT_NAME_FOR_VERSION_STRING=coreutils

cargo install coreutils
```

Cargo安装后，需要使用`coreutils`前缀才能使用这些命令，例如：`coreutils ls`

可以使用软链接直接覆盖原来的`BSD/coreutils`

```sh
mkdir -p ~/.local/uutils-coreutils

for util in b2sum b3sum base32 base64 basename basenc cat cksum comm cp csplit cut date dd df dir dircolors dirname du echo env expand expr factor false fmt fold hashsum head join link ln ls md5sum mkdir mktemp more mv nl numfmt od paste pr printenv printf ptx pwd readlink realpath rm rmdir seq sha1sum sha224sum sha256sum sha3-224sum sha3-256sum sha3-384sum sha3-512sum sha384sum sha3sum sha512sum shake128sum shake256sum shred shuf sleep sort split sum tac tail tee test touch tr true truncate tsort unexpand uniq unlink vdir wc yes; do
    ln -sf ~/.cargo/bin/coreutils ~/.local/uutils-coreutils/$util
done
```

然后去`~/.zshrc`（或其他shell配置）中添加：

```sh
export PATH="$HOME/.local/uutils-coreutils:$PATH"
```

检查下：

```sh
cat --version
# cat (coreutils) 0.1.0
```

**2. Homebrew 安装（现在叫 uutils-coreutils）**

注意不要和`GNU/coreutils`一起安装

如果已经安装了`GNU/coreutils`，需要先：`brew unlink coreutils`

```sh
brew install uutils-coreutils
```

安装后命令多带 `u` 前缀（`uls`、`ucp`）

检查：

```sh
uls --version
```

可以使用软连接直接替代原来的所有`BSD/coreutils`

```sh
mkdir -p ~/.local/uutils-coreutils

for cmd in /opt/homebrew/bin/u*; do
  base=$(basename "$cmd" | sed 's/^u//')
  ln -sf "$cmd" "$HOME/.local/uutils-coreutils/$base"
done
```

然后去`~/.zshrc`（或其他shell配置）中添加：

```sh
export PATH="$HOME/.local/uutils-coreutils:$PATH"
```

检查下：

```sh
cat --version
# cat (uutils coreutils) 0.1.0
```

### Linux

#### **GNU coreutils（绝大多数 Linux 默认）**

不需要安装，Ubuntu、Debian、CentOS、Arch 等全部内置。

检查：

```sh
ls --version
# 输出 "ls (GNU coreutils) x.x"
```

升级新版本：

```sh
sudo apt install coreutils        # Debian/Ubuntu
sudo dnf install coreutils        # Fedora/RHEL
sudo pacman -S coreutils          # Arch
```

#### **BSD coreutils（移植体验 or 开发需求）**

没有发行版自带，需手动编译或安装移植包！如想体验 FreeBSD 的 ls/cp 等，可：

```sh
# 以 Ubuntu 为例
sudo apt install bsdutils bsdmainutils
# 这不是标准BSD coreutils，而是移植部分，还有
sudo apt install bsdextrautils
```

- 也可尝试直接从 FreeBSD ports 源码编译（复杂度较高）。
- 典型用法如 `bsdcp`、`bsdls`（部分系统有前缀），有时直接用 `bsd-` 开头。

#### **Rust uutils coreutils**

推荐用 Cargo：

```sh
cargo install coreutils
```

或多发行版已集成二进制包，直接安装：

```sh
sudo apt install uutils-coreutils
sudo dnf install uutils-coreutils
```

配置 PATH 参考 macOS 步骤，注意与系统原命令区分。

### Windows

#### **GNU coreutils**

推荐 [Gow](https://github.com/bmatzelle/gow)、[GnuWin32](http://getgnuwin32.sourceforge.net/)，或直接装
[MSYS2](https://www.msys2.org/)、WSL（Windows Subsystem for Linux）：

- **MSYS2/MinGW：** 全面支持 GNU 工具，命令行风格与 Linux 一致。
- **WSL：** 直接获得原生 Linux 环境，核心底层就是 GNU coreutils。

示例（以 MSYS2 为例）：

```sh
pacman -S coreutils
```

#### **BSD coreutils**

官方无原生移植包！

想玩 BSD 工具，建议：

- 在 WSL 里装 FreeBSD 容器
- 手动编译 BSD coreutils 源码（不推荐，难度高）
- 下载 BSD for Windows 的移植发行版（很少见，且维护不活跃）

#### **Rust uutils coreutils**

Windows 完全支持！推荐用 Cargo：

```sh
cargo install coreutils
```

- 配合 Git Bash、PowerShell，直接在用户目录下 PATH 调用 `uls`、`ucp` 等命令。
- 检查路径设置，确认 Cargo bin 目录已加入环境变量。

### 安装小结

**PATH顺序决定命令优先级**

- 多版本并存时，`which ls` 决定“你调用的是谁”。
- 脚本移植或测试时，建议命令全部写明全路径，或用专用前缀避免意外。

**常见 Aliases 可解锁多版本切换**：

```sh
alias ls='gls'       # 指定用GNU
alias ls='uls'       # 用Rust
```

若仅笔记/学习建议不要全局 alias，根路径最保险。
