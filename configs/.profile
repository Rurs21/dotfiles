# Define XDG_CONFIG_HOME if it's not already set
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export CONFIG_DIR=$XDG_CONFIG_HOME

. "$CONFIG_DIR/sh/.secrets.env"

. "$HOME/.cargo/env"

