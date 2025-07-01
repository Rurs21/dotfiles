#!/bin/sh

# Run from script's directory to handle relative paths
cd "${0%/*}" || exit 1

. "./_lib.sh" 

# Recursively symlink files from src to dest
# $1=src $2=dest
relink() {
	# Iterate over files and directories, including hidden, skipping _* and . ..
	for file in "$1"/[!._]* "$1"/.[!.]* "$1"/..?*; do
		[ -e "$file" ] || continue
		file_name=$(basename "$file")

		if [ -f "$file" ] && [ ! -e "$2/$file_name" ] ; then
			ln -s "$file" "$2"
			printf '%s/%b\n' "~${2#"$HOME"}" "${BOLD}$file_name${RESET}";
		elif [ -d "$file" ]; then
			# Add to .config if not hidden parent dir
			case "$2/$file_name" in
				*.*) subdir=$2/$file_name ;;
				*) 	 subdir="$2/.config/$file_name" ;;
			esac
			mkdir -p "$subdir"
			relink "$file" "$subdir" # Recurse
		fi
	done
}

CONFIG_DIR=$(pwd -P)/configs

relink "$CONFIG_DIR" "$HOME"
relink "$CONFIG_DIR/_$(uname)" "$HOME"

