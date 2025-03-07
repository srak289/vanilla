#!/bin/bash

if [ ! $(which wget) ]; then
    echo "Please install wget"
    exit 1
fi
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz -O rg.tar.gz

RG_TOPDIR=$(tar tf rg.tar.gz | sed -n 1p)

tar -xf rg.tar.gz --xform "s/${RG_TOPDIR}/${HOME}\/.local\/bin/' ${RD_TOPDIR}/rg
