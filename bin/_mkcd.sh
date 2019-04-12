#!/bin/sh

if [ $# -eq 2 ]; then
    mkdir $@ && cd $2
elif [ $# -eq 1 ] && [ $1 != "-p" ]; then
    mkdir $1 && cd $1
else
    echo 'usage: mkcd [-p] <path-to-directory>'
fi
