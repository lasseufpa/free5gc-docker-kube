#!/bin/bash

mongod --bind_ip $1 &>/dev/null &
mongoimport --host $1 --db free5gc --collection subscribers --file ./ue.json --jsonArray

