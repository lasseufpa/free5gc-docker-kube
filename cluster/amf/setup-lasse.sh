#!/bin/sh

cd support/freeDiameter
./make_certs.sh .
cd ../..
make install

cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf
cp /free5gc/install/etc/free5gc/freeDiameter/amf-lasseconfiguration.conf /free5gc/install/etc/free5gc/freeDiameter/amf.conf

#environment variable on the command line in correct order (MONGO, HSS, AMF, UPF, SMF, PCRF)
sed -i "s|IP_MONGO|$1|g" /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_AMF|$3|g"  /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_SMF|$5|g"  /free5gc/install/etc/free5gc/free5gc.conf
sed -i "s|IP_AMF|$3|g"  /free5gc/install/etc/free5gc/freeDiameter/amf.conf
sed -i "s|IP_HSS|$2|g"  /free5gc/install/etc/free5gc/freeDiameter/amf.conf

touch /free5gc/install/var/log/free5gc/free5gc.log
ln -sf /proc/1/fd/1 /free5gc/install/var/log/free5gc/free5gc.log

./free5gc-amfd &

exit 0
