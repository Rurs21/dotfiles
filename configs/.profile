
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
export LC_TIME=C
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

. $CONFIG_HOME/sh/env
. $CONFIG_HOME/sh/basedir.env
. $CONFIG_HOME/sh/.secrets.env

# user local bin
export PATH="$HOME/.local/bin:$PATH"

# dedupe PATH in case .profile gets sourced more than once
PATH=$(printf '%s' "$PATH" | awk -v RS=: '!seen[$0]++{printf(NR>1?":":"")$0}')
export PATH

export PROFILE_LOADED=true

