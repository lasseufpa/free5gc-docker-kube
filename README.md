# free5gc-docker-compose
#docker-compose of free5gc

## What's this?

The free5GC is an open-source project for 5th generation (5G) mobile core network. Currently, the major contributors are with National Chiao Tung University (NCTU). Although the ultimate goal of this project is to implement 3GPP Release 15 (R15) and Release 16 (R16) 5G core network (5GC), in current version we only implement three most important components in 5GC, namely Access and Mobility Management Function (AMF), Session Management Function (SMF) and User Plane Function (UPF). Thus, current version is mainly for the enhance Mobile Broadband (eMBB). Other features such as Ultra-Reliable Low Latency Connection (URLLC) and Massive Internet of Things (MIoT) are not supported yet.

The source code of free5GC can be downloaded from [here](https://bitbucket.org/nctu_5g/free5gc).

### free5GC-docker
free5GC-docker is an free5gc all-in-one implement in docker-compose. It's for easier test and develop the project.

### Run Up
Because we need to create tunnel interface, we need to use privileged container with root permission.
```bash
$ git clone https://gitlab.lasse.ufpa.br/2020-ai-testbed/ai-testbed/free5gc-docker-kube.git
$ cd free5gc-docker-kube
```

After you run up your compose, attach into docker and start your test or develop
```bash
$ docker exec -it free5gc bash
# cd free5gc
# ./test/testngc -f install/etc/free5gc/test/free5gc.testngc.conf
```

## Troubleshooting
Sometimes, you need to drop data from DB(See #Troubleshooting from https://www.free5gc.org/installation).
```bash
$ docker exec -it mongodb mongo
> use free5gc
> db.subscribers.drop()
> exit # (Or Ctrl-D)

## Reference
- https://github.com/open5gs/nextepc/tree/master/docker


