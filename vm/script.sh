#!/bin/bash

# -- enable root console login

USERNAME=changeme

cat <<EOF > /etc/securetty
tty0
tty1
tty2
tty3
tty4
tty5
tty6
tty7
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

useradd ${USERNAME}
usermod -aG sudo ${USERNAME}
chsh -s /bin/bash ${USERNAME}
echo -e "Password1234#\nPassword1234#" | passwd ${USERNAME}
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

