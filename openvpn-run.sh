#!/bin/bash -x

if [ ! -e /dev/net/tun ]; then
  mkdir -p /dev/net && mknod /dev/net/tun c 10 200
fi

/rm-openvpn-rules.sh
/add-openvpn-rules.sh
/usr/sbin/openvpn --cd /etc/openvpn --config /etc/openvpn/server.conf
