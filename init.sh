#!/bin/sh

# log file
LOGFILE="$HOME/init_dotfiles.log"
echo "" > "$LOGFILE"

SCRIPT_DIR=$(cd "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/_lib.sh"

setup_traps

echo_bold "POSIX init script\n"

prompt_sudo

if [ $(uname) = Darwin ]; then
	echo "For MacOS..."
	# install xcode
	echo_running "Installing xcode tools... "
	if [ ! -e /Library/Developer/CommandLineTools/usr/bin/git ]; then
		xcode-select --install >> "$LOGFILE" 2>&1
	fi
	if prompt_yn "Update xcode tools ?"; then
		echo_running "Updating xcode tools... "
		sudo softwareupdate -i -a >> "$LOGFILE" 2>&1 
	fi
	echo_ok "xcode tools"
	# install brew
	echo_running "Installing brew... "
	if ! is_installed brew; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebew/install/master/install.sh)" || echo_fatal
	else
		echo_running "Updating brew... "
		brew update >> "$LOGFILE" 2>&1
		brew upgrade >> "$LOGFILE" 2>&1
	fi
	echo_ok "brew"
fi


echo_running "Installing vim-plug... "
if [ ! -e ~/.config/vim/autoload/plug.vim ]; then
	curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo_ok "vim-plug"

echo_running "Installing tmux tpm... "
if [ ! -e ~/.config/tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
echo_ok "tmux tpm"

