#!/bin/sh

cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf

sed -i "s|IP_MONGO|$1|g" /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_UPF|$4|g"  /free5gc/install/etc/free5gc/free5gc.conf

touch /free5gc/install/var/log/free5gc/free5gc.log
ln -sf /proc/1/fd/1 /free5gc/install/var/log/free5gc/free5gc.log

./free5gc-upfd &


