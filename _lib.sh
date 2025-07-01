# shellcheck disable=SC2034,SC2064

# Define ANSI escape codes and helper functions
# for styled terminal output.

ESC="\033["
RESET=$ESC"0m"
BOLD=$ESC"1m"
RED=$ESC"31;1m"
GREEN=$ESC"32;1m"
YELLOW=$ESC"33;1m"

PREV_LINE=$ESC"1A"
CLEAR_LINE="${ESC}2K${ESC}G"

CURSOR_SHOW="${ESC}?25h"
CURSOR_HIDE="${ESC}?25l"

echo_bold() { printf '%b' "${BOLD}$1${RESET}"; }

echo_ok() {
	printf '%b' "$CLEAR_LINE"
	printf '%b\n' "${GREEN}[ok]${RESET} $1"
}

echo_running() {
	printf '%b' "$CLEAR_LINE"
	printf '%b' "${YELLOW}[\]${RESET} $1"
}

echo_fatal() {
	printf '%b' "$CLEAR_LINE"
	printf '%b\n' "${RED}[error]${RESET} $1"; exit 1
}

# simple utils

silent() {
	"$@" >/dev/null 2>&1
}

is_installed() {
	silent command -v "$1" && return 0 || return 1
}

# prompt_yn: Prompts the user with a yes/no question 
# returns success (0) for "yes", failure (1) for anything else.

prompt_yn() {
	printf '%b' "$CLEAR_LINE"
	printf '%b' "$1 [y/n]: "
	IFS= read -r ans
	printf '%b' "${PREV_LINE}${CLEAR_LINE}"
	case "$ans" in
		[Yy]|[Yy][Ee][Ss]) return 0 ;;
		[Nn]|[Nn][Oo])     return 1 ;;
		*)                 return 1 ;;
	esac
}

# prompt_sudo: Securely prompts for the sudo password (up to 3 attempts),
# validating it silently before proceeding.

export SUDO_PROMPT="sudo password: "
prompt_sudo() {
	if silent sudo -Nnv || ! prompt_yn "Wana use sudo?"; then
		return
	fi
	ATTEMPT=0
	while [ "$ATTEMPT" -lt 3 ]; do
		printf '%s' "$SUDO_PROMPT"
		stty -echo; IFS= read -r PASSWORD; stty echo
		printf '%b' "$CLEAR_LINE"
		echo "$PASSWORD" | silent sudo -S -v && break
		ATTEMPT=$((ATTEMPT + 1))
		if [ "$ATTEMPT" -eq 3 ]; then
			printf "sorry. :(\n"
		else
			printf "try again, "
		fi
	done
}

# Set up signal traps to ensure graceful termination:
# Restores terminal settings, shows cursor, and exits cleanly.

SIGNALS="EXIT QUIT TERM INT HUP ABRT PIPE ALRM"
INTERRUPT_SIGNALS=$(set -- $SIGNALS; shift; echo "$*")
cleanup() {
	sig="$1"
	if [ -n "$sig" ]; then
		printf '\n%s' "Caught signal: $sig — "
	fi
	printf '%s' "Cleaning up... "
	printf '%b' "$CURSOR_SHOW"
	printf '%b' "$RESET"
	stty sane
	echo "Goodbye!"; trap - EXIT
	exit
}

setup_traps() {
	trap cleanup EXIT
	for sig in $INTERRUPT_SIGNALS; do
		trap "cleanup $sig" "$sig"
	done
}

