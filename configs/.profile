
# default programs
export EDITOR=vim
export PAGER=less
export MANPAGER=$PAGER
export BROWSER=firefox

# define locale
export LANG=en_US.UTF-8
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=C
export LC_NUMERIC=C
export LC_TIME=fr_CA.UTF-8
export LC_MONETARY=fr_CA.UTF-8
# export LC_ALL=$LANG

# temporary folder
export TMP=$HOME/tmp
export TEMP=$TMP
export TMPDIR=$TMP

# define XDG Base Directory spec if not already define
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# short alias because typing XDG_SOMETHING_HOME gets old fast
export CONFIG_HOME=$XDG_CONFIG_HOME
export CACHE_HOME=$XDG_CACHE_HOME
export DATA_HOME=$XDG_DATA_HOME
export STATE_HOME=$XDG_STATE_HOME

. "$CONFIG_HOME/sh/env"
. "$CONFIG_HOME/sh/.secrets.env"

CARGO_ENV="$HOME/.cargo/env"
if [ -e "$CARGO_ENV" ]; then
	. "$HOME/.cargo/env"
fi

export RIPGREP_CONFIG_PATH="$CONFIG_HOME/ripgrep/config"

export PROFILE_READ=true

