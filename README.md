# free5gc-docker-kube
This repository contains the necessary files for the deployment of 5G modules (AMF, HSS, SMF, PCRF, and UPF) by Free5Gc through Docker and Kubernetes

## What's Free5Gc?

The free5GC is an open-source project for the 5th generation (5G) mobile core network. The source code of free5GC can be downloaded from [here](https://bitbucket.org/nctu_5g/free5gc).

## Environment 

Basically all modules have the same basic environment configuration (which is done in the free5gc-base Dockerfile). The difference is that in all free5gc.conf and / or [module].conf must be configured differently. UPF has a difference from all other modules, it must have two network interfaces: a bridge (free5gc network) and a TUN device.

## Changes in files
### AMF
1. In `./install/etc/free5gc/free5gc.conf`
 - **AMF s1ap address** -> AMF addr
 - specify your mcc and mnc in **GUMMEI and TAI**
 - **SMF SBI** -> SMF addr and port 
 - **db_uri** -> mongodb://[MONGO addr]:27017/free5gc
2. In `./install/etc/free5gc/freediameter/amf.conf`
 - **Diameter listen address** -> ListenOn = "[AMF addr]";
 - **HSS Diameter address** ->  { ConnectTo = "[HSS addr]"; No_TLS; };
### HSS
1. In `./install/etc/free5gc/freediameter/hss.conf`
 - **Diameter listen address** -> ListenOn = "[HSS addr]";
 - **AMF diameter address** -> { ConnectTo = "[AMF addr]"; No_TLS; };
### SMF
1. In `./install/etc/free5gc/free5gc.conf`
 - **SMF PFCP addr** -> SMF addr
 - **SMF UPF addr** -> UPF free5gc network addr
 - **SMF HTTP addr** ->  SMF addr
2. In `./install/etc/free5gc/freediameter/smf.conf`
 - **Diameter listen address** -> ListenOn = "[SMF addr]";
 - **PCRF Diameter address** ->  { ConnectTo = "[PCFR addr]"; No_TLS; };
### PCRF
1. In `./install/etc/free5gc/freediameter/pcrf.conf`
 - **Diameter listen address** -> ListenOn = "[PCRF addr]";
 - **SMF Diameter address** ->  { ConnectTo = "[SMF addr]"; No_TLS; };
### UPF
1. In `./install/etc/free5gc/free5gc.conf`
 - **PFCP addr** -> UPF free5gc network addr
 - **GTP-U addr** -> UPF free5gc network addr

