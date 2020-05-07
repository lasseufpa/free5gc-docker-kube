# free5gc-docker-kube
This repository contains the necessary files for the deployment of 5G modules (AMF, HSS, SMF, PCRF, and UPF) by Free5Gc through Docker and Kubernetes

## What's Free5Gc?

The free5GC (https://www.free5gc.org/) is the first open-source 5th generation mobile core network based on the specifications defined by 3GPP. This open-source project is the first 3GPP R15 5G core network in Taiwanthe world. It allows the base-station manufacturer to verify their systemsdevices. Also, it will enable industries to develop future technologies such as AI, 8K HD video transmission, AR/VR,V2X for mobile communications. The most important one is that it enables vertical industries to deploymanage a private network away from mobile operators. 

## Stage 1 (current release)
Migrating 4G Evolved Packet Core (EPC) into 5GC Service-Based Architecture (SBA)

## Stage 2
Implementing the 5GC features.

## Stage 3
A full operational 5G. At least one of the application services, such as VoLTE, IPTV, will be supported in this stage. Add features: Operation, Administration and Management (OAM) of 5GC, 5G Orchestrator, and Network Slicing.

## Environment 

Basically all stage 1 modules have the same basic environment configuration (which is done in the free5gc-base Dockerfile). The difference is that in all free5gc.conf and / or [module].conf must be configured differently. UPF has a difference from all other modules, it must have two network interfaces: a bridge (free5gc network) and a TUN device.

## Starting
Each box of project is based on a compiled free5gc image. To build this image use the follow command:

``sudo docker build -t free5gc ./free5gc-base/``

To run use the following command:

``sudo docker-compose up -d``

To exec bash in container:

``sudo docker exec -i -t [container-id] /bin/bash``

Container-id can be acess on ``sudo docker ps -a``

## Running 

Execution Order: HSS, AMF, UPF, SMF, PCRF: 

In containers:
``./setup-lasse.sh 192.188.2.10 192.188.2.3 192.188.2.2 192.188.2.1 192.188.2.4 192.188.2.5``

NOTE: We are setting up

mongo IP = 192.188.2.10

hss IP = 192.188.2.3

amf IP = 192.188.2.2

upf IP = 192.188.2.1

smf IP = 192.188.2.4

pcrf IP = 192.188.2.5

## Troubles 

``ERRR: - The certificate is expired``

```
cd support/freeDiameter
./make_certs.sh .
cd ../..
make install
cp /usr/src/free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf /usr/src/free5gc/install/etc/free5gc/free5gc.conf
cp /usr/src/free5gc/install/etc/free5gc/freeDiameter/[module name]-lasseconfiguration.conf /usr/src/free5gc/install/etc/free5gc/freeDiameter/[module name].conf
```

lasse-setup.sh solve this.

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

