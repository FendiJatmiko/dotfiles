# Zshrc

# not running interactively then bail
[[ $- != *i* ]] && return

# shell opts
setopt auto_cd
setopt bang_hist
setopt completealiases
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history

# alias
alias gco='git checkout'
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias upd='sudo pacman -Syyu'
alias pac='sudo pacman --color auto'
alias merge='xrdb -merge ~/.Xresources'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'

al-info

# Custome Mine
export WORKSPACE="$HOME/workSpace-01"
# if you wanna switch back to go1.9 change goroot below to /usr/local/go 
# to use go version 163 /usr/local/go163/go/bin
export GOROOT=/usr/local/go
export GOBIN="/home/dyoben/workSpace-01/golang/src/bin"
export GOPATH="/home/dyoben/workSpace-01/golang/src"
export WORK="$GOPATH/src/github.com/AuthScureDevelopment/"
export MINE="$GOPATH/src/github.com/fendijatmiko/fendtoryProject"
export GIT_TERMINAL_PROMPT=1
#export liteide=/opt/liteide/bin/liteide
export TEMP=/tmp/
export PATH=$PATH:/usr/local/go/bin

#unset GOBIN
#export PATH=$PATH:$GOPATH/bin

#export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"

export PATH=$PATH:$GOPATH/bin
export VISUAL="vim"
