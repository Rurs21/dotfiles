#/bin/sh

is_hidden() {
    fchar=`basename $1 | cut -c1`
    test $fchar = "."
    return $?
}

# Recursion link
# $1=src $2=dest
relink() {
    # Include hidden files and Exclude files starting with _
    for file in $1/{[^_],.[^.],..?}*; do
        if [ -f $file ]; then
            ln -sf $FILE $2
        elif [ -d $file ]; then
            dir=`basename $file`
            dest=$2/$dir
            if ! is_hidden $dir && [ ${2#*'.config'} == $2 ]; then
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
