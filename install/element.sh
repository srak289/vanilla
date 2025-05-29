if [ ${EUID} -ne 0 ]; then
    echo "Run as root"
    exit 1
fi

apt install -y wget apt-transport-https

wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" |  tee /etc/apt/sources.list.d/element-io.list

apt update

apt install element-desktop
