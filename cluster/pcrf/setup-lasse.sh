#!/bin/sh

cd support/freeDiameter
./make_certs.sh .
cd ../..
make install
cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf
cp /free5gc/install/etc/free5gc/freeDiameter/pcrf-lasseconfiguration.conf /free5gc/install/etc/free5gc/freeDiameter/pcrf.conf

sed -i "s|IP_MONGO|$1|g" /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_PCRF|$6|g" /free5gc/install/etc/free5gc/freeDiameter/pcrf.conf
sed -i "s|IP_SMF|$5|g" /free5gc/install/etc/free5gc/freeDiameter/pcrf.conf

touch /free5gc/install/var/log/free5gc/free5gc.log
ln -sf /proc/1/fd/1 /free5gc/install/var/log/free5gc/free5gc.log

./nextepc-pcrfd &
