#!/bin/bash

set -euE -o pipefail

if [ ! -x $(which wget) ]; then
    echo "Please install 'wget'"
    exit 1
fi
if [ ! -x $(which unzip) ]; then
    echo "Please install 'unzip'"
    exit 1
fi

if [ ! -d ${HOME}/.fonts ]; then
    mkdir ${HOME}/.fonts
fi

if [ ! -f ./Mononoki.zip ]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
fi

unzip Mononoki.zip -d ${HOME}/.fonts
rm Mononoki.zip
