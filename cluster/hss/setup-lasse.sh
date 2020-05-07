#!/bin/sh

cd support/freeDiameter
./make_certs.sh .
cd ../..
make install

cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf
cp /free5gc/install/etc/free5gc/freeDiameter/hss-lasseconfiguration.conf /free5gc/install/etc/free5gc/freeDiameter/hss.conf

sed -i "s|IP_MONGO|$1|g" /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_AMF|$3|g"  /free5gc/install/etc/free5gc/freeDiameter/hss.conf
sed -i "s|IP_HSS|$2|g"  /free5gc/install/etc/free5gc/freeDiameter/hss.conf

./nextepc-hssd


