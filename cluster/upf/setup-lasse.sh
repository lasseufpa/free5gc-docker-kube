#!/bin/sh

cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf

sed -i "s|IP_MONGO|$1|g" /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_UPF|$4|g"  /free5gc/install/etc/free5gc/free5gc.conf

./free5gc-upfd


