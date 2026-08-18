if [ "$PROFILE_READ" != "true" ]; then
	. $HOME/.profile
fi

export ZDOTDIR=${ZDOTDIR:-$CONFIG_HOME/zsh}
export SHELLRC=$ZDOTDIR/.zshrc
export TMPPREFIX=$TMPDIR/zsh

# Keep PATH entries unique.
typeset -U path PATH

