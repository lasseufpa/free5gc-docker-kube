#!/bin/bash

mongod --bind_ip $1 &>/dev/null &
sleep 10s
mongoimport --host $1 --db free5gc --collection subscribers --file ./ue.json --jsonArray

