# install plugin manager & the defined plugins

# Antidote
antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

if [[ ! -d $antidote_dir ]]; then
	print -u2 "Antidote is not installed."
	return
fi

if [[ ! -f $plugins_txt ]]; then
	print -u2 "Missing plugin list: $plugins_txt"
	return
fi

# Lazy-load antidote from its functions directory
fpath=($antidote_dir/functions $fpath)
autoload -Uz antidote

# Regenerate the static plugin file when the plugin list changes.
if [[ ! $static_file -nt $plugins_txt ]]; then
    #source $antidote_dir/antidote.zsh
    antidote bundle <$plugins_txt >|$static_file
fi

source $static_file

unset antidote_dir plugins_txt static_file

