#!/bin/sh

#if ! grep "uptun" /proc/net/dev > /dev/null; then
#    ip tuntap add name uptun mode tun
#fi
#ip addr del 45.45.0.1/16 dev uptun 2> /dev/null
#ip addr add 45.45.0.1/16 dev uptun
#ip addr del cafe::1/64 dev uptun 2> /dev/null
#ip addr add cafe::1/64 dev uptun
#ip link set uptun up

apt-get install net-tools
ip tuntap add name uptun mode tun
ip addr add 45.45.0.1/16 dev uptun
ip link set uptun up
sh -c "echo 'net.ipv6.conf.uptun.disable_ipv6=0' > /etc/sysctl.d/30-free5gc.conf"
sysctl -p /etc/sysctl.d/30-free5gc.conf
ip addr add cafe::1/64 dev uptun
sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I INPUT -i uptun -j ACCEPT

