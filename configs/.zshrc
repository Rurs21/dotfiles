# .zshrc
source ~/.antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

ZSH_HIGHLIGHT_STYLES[default]=fg=007
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=007
ZSH_HIGHLIGHT_STYLES[alias]=fg=031,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=003
ZSH_HIGHLIGHT_STYLES[command]=fg=031
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=043
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=043
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

export SHELLRC"$HOME/.zshrc"
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
alias ls='ls --color'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias colors='~/Scripts/colors.sh'
alias dotfiles='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias npm='nocorrect npm'

unsetopt beep
bindkey -e

# Features
setopt extendedGlob
setopt prompt_subst
setopt correct

autoload -U zmv
autoload -Uz vcs_info
autoload -Uz compinit
compinit -i

zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=7
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion:*:descriptions' format '%B%K{6} %d %k%b'

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

confirm() {
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

confirm_wrapper() {
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

setup_git_prompt() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        unset git_prompt
        return 0
    fi

    local git_status_dirty git_branch

    if [ "$(git --no-optional-locks status --untracked-files='no' --porcelain)" ]; then
        git_status_dirty='%F{10}*'
    else
        unset git_status_dirty
    fi

    git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
    git_branch="${git_branch#refs/heads/}"

    if [ "${#git_branch}" -ge 24 ]; then
        git_branch="${git_branch:0:21}..."
    fi

    git_branch="${git_branch:-no branch}"

    git_prompt="%F{008}[%F{003}%B${git_branch}${git_status_dirty}%b%F{008}]"
}

precmd() {
    setup_git_prompt
}

#PROMPT
PROMPT='%F{070}%n%f@%F{025}%m%f %F{080}%(5~|%-1~/.../%3~|%4~)%f ${git_prompt}%f%# '
#SPELLING PROMPT
SPROMPT='%F{197}Do you mean %B%r%b ? %F{3}Nyae!%f 🐱 '
#RIGHT PROMPT
#RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f'

