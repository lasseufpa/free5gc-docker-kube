#!/bin/bash

iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i uptun -o enp3s0 -j ACCEPT
