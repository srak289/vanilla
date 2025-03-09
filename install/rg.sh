#!/bin/bash

set -euE -o pipefail

if [ ! $(which wget) ]; then
    echo "Please install wget"
    exit 1
fi
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz -O rg.tar.gz

RG_TOPDIR=$(tar tf rg.tar.gz | sed -n 1p)
LOCAL_BIN="${HOME}/.local/bin"

# trailing slash in RG_TOPDIR from tar listing
tar -xf rg.tar.gz --xform "s/${RG_TOPDIR}/" ${RG_TOPDIR}rg
rm rg.tar.gz
mv rg ${LOCAL_BIN}
