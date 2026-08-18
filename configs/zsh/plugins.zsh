# install plugin manager & the defined plugins

# Antidote
antidote_dir=$DATA_HOME/zsh/antidote
export ANTIDOTE_HOME=$DATA_HOME/zsh/antidote-bundles
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=$CACHE_HOME/zsh/plugins.zsh

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
	mkdir -p ${static_file:h}
	antidote bundle <$plugins_txt >|$static_file
fi

source $static_file

unset antidote_dir plugins_txt static_file
