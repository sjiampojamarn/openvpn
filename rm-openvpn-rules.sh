#!/bin/sh
iptables -t nat -D POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
iptables -D INPUT -i tun0 -j ACCEPT
iptables -D FORWARD -i eth0 -o tun0 -j ACCEPT
iptables -D FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -D INPUT -i eth0 -p tcp --dport 443 -j ACCEPT
