# greeting with pfetch
function fish_greeting
    if type -q pfetch
        pfetch
    end
end


# 环境变量与 PATH 配置（合并设置，顺序从专用到全局）
set -gx BREW_HOME /opt/homebrew

set -gx PATH \
    $HOME/.cargo/bin \
    $BREW_HOME/bin \
    # $BREW_HOME/opt/openjdk/bin \
    # $BREW_HOME/opt/ruby/bin \
    # $BREW_HOME/opt/curl/bin \
    $PATH

# lsd 相关 alias
if type -q lsd
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -la'
end

# nvim 相关 alias
if type -q nvim
    alias vi='nvim'
    alias vim='nvim'
end

# bobthefish configs
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes
# set -g theme_color_scheme nord   # 或 dark/nord/solarized/zenburn/dracula
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_display_cmd_duration yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '

