#!/bin/bash

set -euE -o pipefail

if [ -f ${HOME}/.local/bin/nvim ]; then
    echo "'nvim' appears to be present in .local"
    exit 1
fi

if [ ! -x $(which wget) ]; then
    echo "Please install 'wget'"
    exit 1
fi

wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz

if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi

tar -xf nvim-linux-x86_64.tar.gz --xform "s/nvim-linux-x86_64/.local/"
rm nvim-linux-x86_64.tar.gz
