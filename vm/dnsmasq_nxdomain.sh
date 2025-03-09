#!/bin/bash
curl -v -sL $1 | sed -ne \
's/0\.0\.0\.0 \([a-zA-Z0-9][a-zA-Z0-9._-]*\)/address=\/\1\//p' > \
/etc/dnsmasq.d/$2
