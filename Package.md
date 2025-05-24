# Rust 锈化指南

## Rust 高质量终端工具速查表

| 工具名      | 功能定位                      | 特点简述                                         | 推荐人群/场景                   | 官网/项目主页                                      |
|-------------|-------------------------------|--------------------------------------------------|----------------------------------|---------------------------------------------------|
| coreutils   | 基础命令集(兼容GNU)           | 基本命令 Rust 实现，安全兼容                     | 所有命令行用户，脚本须谨慎替换   | <https://github.com/uutils/coreutils>               |
| nushell     | 新一代Shell                   | 全结构化数据管道，现代命令体验                   | 现代极客、数据流转、脚本         | <https://www.nushell.sh/>                           |
| bat         | 加强cat                       | 彩色、语法高亮、支持Git、行号等                  | 代码/文本/日常浏览               | <https://github.com/sharkdp/bat>                    |
| procs       | 加强ps                        | 彩色表格、进程树、过滤、分栏等                   | 开发、运维/多任务                 | <https://github.com/dalance/procs>                  |
| bottom      | 加强top/htop                  | 多主题、漂亮图表、丰富交互                       | 系统监控、开发运维、桌面党        | <https://github.com/ClementTsang/bottom>            |
| zellij      | 终端复用(自动分屏)            | 现代可交互分屏/插件及界面化                      | 多任务操作，极客                  | <https://github.com/zellij-org/zellij>              |
| lsd         | 加强ls                        | 图标、色彩、树结构、极致美观                     | 日常文件管理、美学                | <https://github.com/lsd-rs/lsd>                     |
| exa         | 加强ls                        | 彩色、Git集成、更多筛选                          | 文件查阅、美观实用                | <https://github.com/ogham/exa>                      |
| ripgrep     | 超强grep                      | 极速代码/文本全文查找                           | 开发者/PTK/处理大量文本            | <https://github.com/BurntSushi/ripgrep>             |
| fd          | 加强find                      | 超快超易用 find 替代，自动忽略.gitignore         | 代码工程师/日常查找               | <https://github.com/sharkdp/fd>                     |
| dust        | 加强du                        | 人性化磁盘空间树、可视化                         | 快速查找占用/系统清理             | <https://github.com/bootandy/dust>                  |
| duf         | 可视磁盘空间                   | 多主题美观磁盘用量展示                           | 综合查看磁盘状态                   | <https://github.com/muesli/duf>                     |
| hyperfine   | benchmark（基准测速）          | 命令测速/统计易用                               | 开发/小工具优化                   | <https://github.com/sharkdp/hyperfine>              |
| gping       | 图形ping                      | 在终端实时显示ping动态图表                        | 网络/服务器运维                   | <https://github.com/orf/gping>                      |
| onefetch    | 项目元信息展示（酷炫）         | 终端展示repo语言、贡献、logo等                    | 极客、开源repo党                  | <https://github.com/o2sh/onefetch>                  |
| broot       | 目录树+导航+模糊查找           | 极其高效的文件目录/模糊/预览                      | 极客、复杂项目文件导航             | <https://github.com/Canop/broot>                    |
| starship    | 通用shell prompt               | 终极可定制、跨平台shell 终端提示符                | zsh/bash/fish用户建议都试          | <https://github.com/starship/starship>              |
| zoxide      | 智能 cd                        | 自动记录/模糊跳目录，超快                         | 重度命令行切目录党                 | <https://github.com/ajeetdsouza/zoxide>              |
| bandwhich   | 网络流量实时监控               | 按进程/端口粒度看终端网络流量                     | 运维/开发                          | <https://github.com/imsnif/bandwhich>               |
| tealdeer    | tldr 的 Rust 版                | 终端命令速查手册，极快（tldr客户端）              | 资料查询，开发必备                  | <https://github.com/dbrgn/tealdeer>                 |

---

## 不错的几个工具

| 名称       | 类别/主功能             | 功能提升特性                             | 场景/推荐点                   | Rust项目主页/官网              |
|------------|-------------------------|------------------------------------------|-------------------------------|-------------------------------|
| coreutils  | 终端基础工具箱           | Rust实现传统ls/cp等，安全性能优           | 所有命令行、自动化脚本         | uutils/coreutils              |
| nushell    | 新shell/结构化终端      | 类似Powershell，数据管道如SQL风格         | 现代极客/命令数据交互          | nushell.sh                    |
| bat        | cat浏览+高亮            | 配色、Git集成、光标跟随、侧边行号         | 日常看文本/代码美美体验         | sharkdp/bat                   |
| procs      | ps进程高亮树            | 交互列、搜索过滤，显示结构更强            | 进程调试/监控                  | dalance/procs                 |
| bottom     | top+gui                  | 主题、图形、交互/书签式监控               | 系统性能一眼看全                | ClementTsang/bottom           |
| zellij     | 分屏终端复用             | 内置自动化切屏/能拓展/可写插件             | 多任务/需要定制终端的极客        | zellij-org/zellij             |

---

## 其他大热 Rust/Linux 终端工具包（推荐收藏）

| 工具        | 描述              | 功能定位               | 主页链接                                     |
|-------------|-------------------|------------------------|----------------------------------------------|
| yazi        | 极快终端文件管理器 | 类ranger的高度定制美观 | <https://github.com/sxyazi/yazi>               |
| mprocs      | 多进程统一面板     | 一屏多命令运行监控      | <https://github.com/pvolok/mprocs>             |
| helix       | 快速文本编辑器     | NeoVim、极致生产力      | <https://github.com/helix-editor/helix>        |
| atuin       | 命令历史管理神器   | 云同步/搜索/跳转       | <https://github.com/atuinsh/atuin>             |
| gitui       | 终端git操作界面    | tui小型git client      | <https://github.com/extrawurst/gitui>          |
| vivid       | 终端ls-colors美化  | 主题配置展现           | <https://github.com/sharkdp/vivid>             |
| sd          | sed的现代替代      | 正则替换人性化         | <https://github.com/chmln/sd>                  |
| gdu         | du交互升级版       | 超快磁盘空间树          | <https://github.com/dundee/gdu>                |
| rm-improved | 增强版 rm          | 防误删/回收站/更强提示   | <https://github.com/nivekuil/rip>              |
| choose      | cut的增强版        | 强大的列切割           | <https://github.com/theryangeary/choose>       |

---

## 非常值得关注的（不是 Rust 写但终端党神器）

| 工具            | 语言           | 简介/主打功能                          | 主页                      |
|-----------------|---------------|----------------------------------------|---------------------------|
| fzf             | Go            | 终端模糊查找跳转，配合cd/git极棒        | <https://github.com/junegunn/fzf>         |
| tmux            | C             | 多路复用终端，分屏、脚本首选            | <https://github.com/tmux/tmux>            |
| navi            | Rust          | 互动式命令速查、配合fzf                  | <https://github.com/denisidoro/navi>      |
| neovim          | C/Lua         | 终极编辑器，终端党必备                  | <https://neovim.io/>                      |
| micro           | Go            | 简易但现代的终端文本编辑器              | <https://github.com/zyedidia/micro>       |

