# syntax hightlight config
# with /zsh-users/zsh-syntax-highlighting plugin

typeset -gA ZSH_HIGHLIGHT_STYLES
# Highligth
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[default]=fg=007
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=007
ZSH_HIGHLIGHT_STYLES[alias]=fg=031,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=003
ZSH_HIGHLIGHT_STYLES[command]=fg=031
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=170
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=170
ZSH_HIGHLIGHT_STYLES[main]=fg=031
ZSH_HIGHLIGHT_STYLES[arg0]=fg=031
ZSH_HIGHLIGHT_STYLES[path]=fg=045,underline
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=010
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=010
ZSH_HIGHLIGHT_PATTERNS=('rm -rf' 'fg=001')
ZSH_HIGHLIGHT_PATTERNS=('poweroff' 'fg=011')
ZSH_HIGHLIGHT_PATTERNS=('~' 'fg=162')

