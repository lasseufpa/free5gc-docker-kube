#!/bin/sh

cd support/freeDiameter
./make_certs.sh .
cd ../..
make install
cp /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /free5gc/install/etc/free5gc/free5gc.conf
cp /free5gc/install/etc/free5gc/freeDiameter/hss-lasseconfiguration.conf /free5gc/install/etc/free5gc/freeDiameter/hss.conf
./nextepc-hssd

