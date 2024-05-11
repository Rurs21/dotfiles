# .zshrc

source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/highlight.zsh
source $ZDOTDIR/.zstyles
source $ZDOTDIR/functions.zsh

# History
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"

# Variables
export SHELLRC="$ZDOTDIR/.zshrc"
export EDITOR="/usr/bin/vim"
export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export GPG_TTY=$(tty)

# Alias
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias cc='clang -Wall -O -std=c17'
alias colors='~/Scripts/colors.sh'
alias gittime='~/Code/Scripts/gittime.sh'
alias increname='~/Code/Scripts/increname.sh'

source ~/.aliases

alias npm='nocorrect npm'
alias python=python3
alias pip=pip3

# Zsh Line Editor [-e emac | -v  vi]
bindkey -e

autoload -U zmv
autoload -Uz vcs_info
autoload -Uz compinit
compinit -i

# Features
unsetopt beep
setopt extended_glob
setopt prompt_subst
setopt correct

