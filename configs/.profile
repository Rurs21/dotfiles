
# default programs
export EDTIOR=vim
export PAGER=less
export MANPAGER=$PAGER
export BROWSER=firefox

# define locale
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=C
export LC_NUMERIC=C
export LC_TIME=fr_CA.UTF-8

# temporary folder
export TMP=$HOME/tmp
export TEMP=$TMP
export TMPDIR=$TMP

# define XDG Base Directory spec if not already define
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

export CONFIG_DIR=$XDG_CONFIG_HOME

# shell histroy
export HISTFILE="$CONFIG_DIR/sh/.history"
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"

# misc
export GPG_TTY=$(tty)

. "$CONFIG_DIR/sh/.secrets.env"

. "$HOME/.cargo/env"

export PROFILE_READ=true

