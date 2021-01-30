#!/bin/sh

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"

echo_ok() {
    printf '%b\n' "$COL_GREEN[ok]$COL_RESET "$1
}

echo_running() {
    printf '%b' "$COL_YELLOW ⇒ $COL_RESET"$1" "
}

echo_fatal() {
    printf '%b\n' "$COL_RED[error]$COL_RESET $1"; exit 1
}

is_installed() {
    command -v "$1" &> /dev/null && return 0 || return 1
}

if [ $(uname) = Darwin ]; then
    echo_running "Installing xcode tools..."
    xcode-select --install
    echo_ok
    echo_running "Installing updates..."
    sudo softwareupdate -i -a
    echo_ok
    if is_installed brew; then
        echo_running "Updating brew..."
        brew update
        brew upgrade
    else
        echo_running "Installing brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebew/install/master/install.sh)" || echo_fatal
    fi
fi
