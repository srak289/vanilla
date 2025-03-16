#!/bin/bash

# sudo apt-get install -y pcsc-lite pcsc-ccid perl-pcsc pcsc-tools opensc-pkcs11 libnss3-tools && \
apt-get install -y pcscd pcsc-tools libnss3-tools opensc
systemctl restart pcscd
systemctl enable pcscd
declare NSSDB=${HOME}/.pki/nssdb
if [ ! -d ${NSSDB} ]; then
    mkdir -p ${NSSDB}
fi
if [ ! -x /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so ]; then
    echo "opensc library not executable"
fi

modutil -dbdir sql:${NSSDB} -add "CAC Module" -libfile /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
modutil -dbdir sql:${NSSDB} -list
