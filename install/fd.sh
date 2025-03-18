#!/bin/bash

set -euE -o pipefail

if [ ! $(which wget) ]; then
    echo "Please install wget"
    exit 1
fi

URL=https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
TGT=fd.tar.gz
BIN=fd

wget ${URL} -O ${TGT}

TGT_TOPDIR=$(tar tf ${TGT} | sed -n 1p | grep -o '.*/')
LOCAL_BIN="${HOME}/.local/bin"

# trailing slash in RG_TOPDIR from tar listing
tar -xf ${TGT} --xform "s/${TGT_TOPDIR}/" ${TGT_TOPDIR}${BIN}
rm ${TGT}
mv ${BIN} ${LOCAL_BIN}
