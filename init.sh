#!/bin/sh

SCRIPT_DIR=$(cd "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/_lib.sh"

CONFIG_HOME=${CONFIG_HOME:-"$HOME/.config"}
DATA_HOME=${DATA_HOME:-"$HOME/.local/share"}
STATE_HOME=${STATE_HOME:-"$HOME/.local/state"}

mkdir -p "$STATE_HOME/dotfiles" || echo_fatal "state directory"
LOGFILE="$STATE_HOME/dotfiles/init.log"
: > "$LOGFILE"

setup_traps

echo_bold "POSIX init script\n"

mkdir -p "$HOME/tmp" "$CONFIG_HOME/sh" || echo_fatal "config directories"

prompt_sudo

if [ "$(uname -s)" = "Darwin" ]; then
	echo "For MacOS..."
	# install xcode
	echo_running "Installing xcode tools... "
	if [ ! -e /Library/Developer/CommandLineTools/usr/bin/git ]; then
		xcode-select --install >> "$LOGFILE" 2>&1
	fi
	if prompt_yn "Update xcode tools ?"; then
		echo_running "Updating xcode tools... "
		# The log belongs to the current user; only softwareupdate needs sudo.
		# shellcheck disable=SC2024
		sudo softwareupdate -i -a >> "$LOGFILE" 2>&1
	fi
	echo_ok "xcode tools"
	# install brew
	echo_running "Installing brew... "
	if ! is_installed brew; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo_fatal "brew"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo_running "Updating brew... "
		brew update >> "$LOGFILE" 2>&1
		brew upgrade >> "$LOGFILE" 2>&1
	fi
	is_installed brew || echo_fatal "brew is not available"
	echo_ok "brew"

	echo_running "Installing Brewfile dependencies... "
	BREWFILE="$SCRIPT_DIR/dependencies/Brewfile"
	[ -f "$BREWFILE" ] || echo_fatal "Missing Brewfile: $BREWFILE"
	brew bundle install --file="$BREWFILE" >> "$LOGFILE" 2>&1 \
		|| echo_fatal "Brewfile dependencies"
	echo_ok "Brewfile dependencies"
fi


echo_running "Installing vim-plug... "
VIM_PLUG="$DATA_HOME/vim/autoload/plug.vim"
if [ ! -e "$VIM_PLUG" ]; then
	curl -fLo "$VIM_PLUG" --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
		|| echo_fatal "vim-plug"
fi
echo_ok "vim-plug"

echo_running "Installing tmux tpm... "
TPM_DIR="$DATA_HOME/tmux/plugins/tpm"
if [ ! -e "$TPM_DIR" ]; then
	mkdir -p "$(dirname "$TPM_DIR")" || echo_fatal "tmux plugin directory"
	git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" \
		>> "$LOGFILE" 2>&1 || echo_fatal "tmux tpm"
fi
echo_ok "tmux tpm"

echo_running "Installing antidote... "
ANTIDOTE_DIR="$DATA_HOME/zsh/antidote"
if [ ! -d "$ANTIDOTE_DIR" ]; then
	mkdir -p "$(dirname "$ANTIDOTE_DIR")" || echo_fatal "antidote directory"
	git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR" \
		>> "$LOGFILE" 2>&1 || echo_fatal "antidote"
fi
echo_ok "antidote"
