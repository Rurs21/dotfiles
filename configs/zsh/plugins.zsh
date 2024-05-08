# install plugin manager & the defined plugins

# Antidote
antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Clone antidote latest release if necessary

[[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir

# Ensure the .zsh_plugins.txt file exists
[[ -e $plugins_txt ]] || touch $plugins_txt

# Lazy-load antidote from its functions directory
fpath=($antidote_dir/functions $fpath)
autoload -Uz antidote

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
    #source $antidote_dir/antidote.zsh
    antidote bundle <$plugins_txt >|$static_file
fi

source $static_file

unset antidote_dir plugins_txt static_file

