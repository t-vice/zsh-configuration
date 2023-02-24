#      _____                  __     ___
#     |_   _|__  _ __  _   _  \ \   / (_) ___ ___
#       | |/ _ \| '_ \| | | |  \ \ / /| |/ __/ _ \
#       | | (_) | | | | |_| |   \ V / | | (_|  __/
#       |_|\___/|_| |_|\__, |    \_/  |_|\___\___|
#                      |___/


# custom plugins list
# https://github.com/marlonrichert/zsh-autocomplete
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zdharma-continuum/fast-syntax-highlighting/
# https://github.com/djui/alias-tips
# https://github.com/mattmc3/zsh-safe-rm
# https://github.com/zshzoo/cd-ls
# https://github.com/zevv/bucklespring
# yewtube
# spotifyd + spotify-tui
# thefuck

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=1000
setopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tvice/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fsh/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/alias-tips/alias-tips.plugin.zsh
source ~/.zsh/cd-ls/cd-ls.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-auto-notify/auto-notify.plugin.zsh

eval $(thefuck --alias)

# blur code I stole from some dude
# Blur {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 5 -id $wid; done
fi
# }}}

# starship prompt
eval "$(starship init zsh)"
# check ~/.config/starship.toml

#aliases
alias pls="sudo"
alias cls="clear && zsh"
alias cat="bat --color=always"
alias code="lvim"
alias e="nvim"
alias find="fd"
alias f="fd"
alias grep="rg"
alias g="rg"
alias l="lsd -1"
alias ls="lsd -al"
alias la="lsd -a1"
alias icat="kitty +kitten icat"
alias ibm="buckle -s 0 -g 20"
alias ibms="buckle -g 20"
alias music="spt"
alias spotify="spt"
alias yt="~/.local/bin/yt"
alias youtube="~/.local/bin/yt"

# Dugan Chen's Autojump for Zsh
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert always
alias j=cdr

# set editor
export VISUAL=nvim
export EDITOR=nvim

# bfetch paths
export BFETCH_ART="figlet welcome! | lolcat"
export BFETCH_INFO="~/.config/bfetch/info.textart"
export BFETCH_COLOR="seq -s'=' 0 $(tput cols) | tr -d '[:digit:]' | lolcat"
export BFETCH_CLASSIC_MODE=false
export BFETCH_SEPARATOR=2
export BFETCH_PROMPT_HEIGHT=0

#export BFETCH_COLOR="figlet welcome! | lolcat"
#export BFETCH_COLOR="/home/tvice/ascii-art/old/color/icon/bloks.textart"

# greeting
bfetch
