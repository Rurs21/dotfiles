if [ "$PROFILE_READ" != "true" ]; then
	. $HOME/.profile
fi

export ZDOTDIR=${ZDOTDIR:-$CONFIG_DIR/zsh}
export SHELLRC=$ZDOTDIR/.zshrc
export TMPPREFIX=$TMPDIR/zsh

source $ZDOTDIR/.zshenv

