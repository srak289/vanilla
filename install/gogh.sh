#!/bin/bash

if [ ! -d gogh ]; then
    git clone https://github.com/gogh-co/gogh --depth 1
fi

declare -x TERMINAL=""

if [ $(which konsole) ]; then
    TERMINAL=konsole
elif [ $(which gnome-terminal) ]; then
    TERMINAL=gnome-terminal
fi

source gogh/installs/kanagawa-wave.sh
source gogh/installs/kanagawa-lotus.sh
source gogh/installs/kanagawa-dragon.sh
