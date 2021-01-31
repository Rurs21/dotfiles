#/bin/sh

is_hidden() {
    fchar=`basename $1 | cut -c1`
    test $fchar = "."
    return $?
}

# Recursion link
# $1=src $2=dest
relink() {
    for file in $1/{*,.[^.],.??*}; do
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

relink $(pwd -P)/configs $HOME
