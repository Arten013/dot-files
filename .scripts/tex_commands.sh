#!/bin/bash

tex_cleanup(){
    if [ $# == 1 ] ; then
        dir="$( cd "$( dirname "${1}" )" >/dev/null 2>&1 && pwd )"
        if [ -d "${1}" ] ; then
            path="${dir%/}/*"
        elif [ -f "${1}" ] ; then
            base=$(basename $1 ".${1##*.}")
            path="${dir%/}/${base}"
        else
            echo "Cannot find $1"
            return 0
        fi
        declare -a arr=(".aux" ".log" ".dvi" ".bbl" ".blg")
        for ext in "${arr[@]}"
        do
            echo "remove ${path}${ext}"
            find $path -type f -name "*${ext}" -exec rm {} +
        done
    else
        echo "Invalid arguments."
        echo "Usage: tex_cleanup dirpath"
    fi
}
t2p(){
    if [ $# == 2 ] ; then
        if [ $1 == "-s" ] ; then
            platex "$2.tex" && dvipdfmx $2
        else
            echo "invalid option (only -s allowed)"
        fi
    elif [ $# == 1 ] ; then
        platex "$1.tex" && \
            pbibtex "$1" && \
            platex "$1.tex" && \
            dvipdfmx "$1"
    else
        echo "invalid arguments."
        echo "Usage: t2p [-s] path (without '.tex' extension)"
    fi
}
