#!/bin/bash

pwd=`pwd`

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "make symbolic $f"
    ln -snfv "$pwd"/"$f" "$HOME"/"$f"
done
