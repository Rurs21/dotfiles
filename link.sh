#!/bin/sh

# Recursion link
# $1=src $2=dest
relink() {
    # Include hidden files and Exclude files starting with _
    for file in $1/{[^_],.[^.],..?}*; do
        if [ -f $file ]; then
            ln -sf $file $2
        elif [ -d $file ]; then
            dir=`basename $file`
            dest=$2/$dir
            #  Add to .config if no hidden parent dir
            if [ ${dir:0:1} != "." ] && [ ${2#*'.'} == $2 ]; then
                dest=$2/.config/$dir
            fi
            mkdir -p $dest
            relink $file $dest
        fi
    done
}

config_dir=$(pwd -P)/configs

relink $config_dir $HOME
relink $config_dir/_$(uname) $HOME

