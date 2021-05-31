# .zshrc

# Antigen
source ~/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

typeset -gA ZSH_HIGHLIGHT_STYLES
# Highligth
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[default]=fg=007
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=007
ZSH_HIGHLIGHT_STYLES[alias]=fg=031,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=003
ZSH_HIGHLIGHT_STYLES[command]=fg=031
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=170
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=170
ZSH_HIGHLIGHT_STYLES[main]=fg=031
ZSH_HIGHLIGHT_STYLES[arg0]=fg=031
ZSH_HIGHLIGHT_STYLES[path]=fg=045,underline
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=010
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=010
ZSH_HIGHLIGHT_PATTERNS=('rm -rf' 'fg=001')
ZSH_HIGHLIGHT_PATTERNS=('poweroff' 'fg=011')
ZSH_HIGHLIGHT_PATTERNS=('~' 'fg=162')

# History
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"

# Variables
export SHELLRC="$HOME/.zshrc"
export EDITOR="/usr/bin/vim"
export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export GPG_TTY=$(tty)

# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# Alias
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias cc='clang -Wall -O -std=c17'
alias colors='~/Scripts/colors.sh'
alias npm='nocorrect npm'
source ~/.aliases

# Zsh Line Editor [-e emac | -v  vi]
bindkey -e

autoload -U zmv
autoload -Uz vcs_info
autoload -Uz compinit
compinit -i

# Features
unsetopt beep
setopt extendedGlob
setopt prompt_subst
setopt correct

# Completion
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=7
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion:*:descriptions' format '%B%K{6} %d %k%b'

# Git Prompt
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr   '%F{10}!'
zstyle ':vcs_info:*' unstagedstr '%F{01}?'
zstyle ':vcs_info:git:*' formats '%F{008}[%F{003}%B%b%%b%u%c%F{008}]%f'


# Prompt
user_info="%F{070}%n%f@%F{025}%m"
working_dir="%F{042}%(4~|%-1~/.../%1~|%~)%f"
PROMPT='${user_info} ${working_dir} %# '
# Spelling prompt
SPROMPT='%F{197}Do you mean %B%r%b ? %F{3}Nyae!%f 🐱 '
# Right prompt
#RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f'

function precmd() {
    vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT='${user_info} ${working_dir} %# '
    else
        # show git repo relative path
        git_toplv="$(basename $(git rev-parse --show-toplevel))"
        git_prefix="$(git rev-parse --show-prefix)"; git_prefix=${git_prefix%?}
        git_working_dir="%F{077}${git_toplv}${git_prefix:+"/$git_prefix"}%f"
        PROMPT='${user_info} ${git_working_dir} ${vcs_info_msg_0_}%# '
    fi
}

# Misc. Functions
function confirm() {
    local answer
    echo -ne "You're sure you want to run ${RED}$* ${NC}? ${yellow}[yN] "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

function confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

poweroff() { confirm_wrapper $0 "$@"; }
reboot() { confirm_wrapper $0 "$@"; }
hibernate() { confirm_wrapper $0 "$@"; }
