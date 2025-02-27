# Generated by Anaconda 34.25.5.9
# Generated by pykickstart v3.32
#version=RHEL9
# Use graphical install
graphical
repo --name="AppStream" --baseurl=file:///run/install/sources/mount-0000-cdrom/AppStream

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

# Keyboard layouts
keyboard --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp1s0 --ipv6=auto --activate
network  --hostname=ipa.nharng.net

# Use CDROM installation media
cdrom

%packages
@^minimal-environment

%end

# Run the Setup Agent on first boot
firstboot --enable

# Generated using Blivet version 3.6.0
ignoredisk --only-use=vda
autopart
# Partition clearing information
clearpart --none --initlabel

timesource --ntp-server=dhcp.mgmt.nharng.net
# System timezone
timezone America/New_York --utc

# Root password
rootpw --iscrypted $6$DkC4.8YT5bZwqdJ5$gq7t.UJu8J5mBjAYlKV/.bEGOKt4Fz2c7R4Am0A./VpBhmtzwBbjgZoTJ4r00pZjrfJKIOx/ieFnCzCAUYe/T/
user --groups=wheel --name=srak --password=$6$9Q2/phClF9f0nand$R/iYF/VxLTQy7pfTuwU3iMRNCwnoUevae2FYhzyKlzJjI752p9.TvboiwYoVmh3P9GeTzIb16bX7HM/tJ.8w1. --iscrypted --gecos="srak"


