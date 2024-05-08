# Define XDG_CONFIG_HOME if it's not already set
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export CONFIG_DIR=$XDG_CONFIG_HOME

export ZDOTDIR=${ZDOTDIR:-$CONFIG_DIR/zsh}
. $ZDOTDIR/.zshenv

