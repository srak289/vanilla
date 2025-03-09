#!/bin/bash
useradd -m _nextcloud
cp -r /home/admin/.ssh /home/_nextcloud/
chown _nextcloud:_nextcloud ~_nextcloud
chsh -s /bin/bash _nextcloud
apt update
apt install -y tmux podman tree git make rsync vim tcpdump
echo -e "net.ipv4.ip_unprivileged_port_start=80\nuser.max_user_namespaces=65536" > /etc/sysctl.d/999-podman.conf
sysctl --system

# -- enable root console login

cat <<EOF > /etc/securetty
ttyS0
ttyS1
ttyS2
ttyS3
ttyS4
ttyS5
ttyS6
ttyS7
EOF

cp /etc/pam.d/login /tmp/login
cat <<EOF >/etc/pam.d/login
auth [success=ok auth_err=1] pam_succeed_if.so user = root
auth [success=done default=ignore] pam_securetty.so
EOF
cat /tmp/login >> /etc/pam.d/login
