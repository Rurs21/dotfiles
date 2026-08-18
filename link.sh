#!/bin/sh

# Link this repository's dotfiles into HOME and XDG_CONFIG_HOME.
# Top-level hidden entries stay in HOME; config directories use XDG_CONFIG_HOME.

# Run from script's directory to handle relative paths
cd "$(dirname -- "$0")" || exit 1

. "./_lib.sh"

CONFLICTS=0
CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

# Link one file. Existing symlinks are refreshed; real files are left alone.
link_file() {
	source_file=$1
	target_file=$2

	if [ -L "$target_file" ]; then
		if [ "$(readlink "$target_file")" = "$source_file" ]; then
			return
		fi
		ln -sfn "$source_file" "$target_file" || echo_fatal "Could not update $target_file"
		echo_ok "updated ~${target_file#"$HOME"}"
	elif [ -e "$target_file" ]; then
		echo_warn "conflict: ~${target_file#"$HOME"} already exists" >&2
		CONFLICTS=$((CONFLICTS + 1))
	else
		ln -s "$source_file" "$target_file" || echo_fatal "Could not link $target_file"
		echo_ok "linked ~${target_file#"$HOME"}"
	fi
}

# Recursively symlink files from src to dest
# $1=src $2=dest
relink() {
	# Iterate over files and directories, including hidden, skipping _* and . ..
	for file in "$1"/[!._]* "$1"/.[!.]* "$1"/..?*; do
		[ -e "$file" ] || [ -L "$file" ] || continue
		file_name=$(basename "$file")

		if [ -f "$file" ] || [ -L "$file" ]; then
			link_file "$file" "$2/$file_name"
		elif [ -d "$file" ]; then
			# Put top-level, non-hidden directories in CONFIG_HOME.
			if [ "$2" = "$HOME" ] && [ "${file_name#.*}" = "$file_name" ]; then
				subdir="$CONFIG_HOME/$file_name"
			else
				subdir="$2/$file_name"
			fi
			mkdir -p "$subdir" || echo_fatal "Could not create $subdir"
			relink "$file" "$subdir" # Recurse
		fi
	done
}

CONFIG_DIR=$(pwd -P)/configs
PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')

relink "$CONFIG_DIR" "$HOME"
relink "$CONFIG_DIR/_$PLATFORM" "$HOME"

if [ "$CONFLICTS" -gt 0 ]; then
	echo_warn "$CONFLICTS conflict(s) left unchanged" >&2
	exit 1
fi

