# Keep PATH entries unique.
typeset -U path PATH

if [[ -z $PROFILE_LOADED ]]; then
	. "$HOME/.profile"
fi

