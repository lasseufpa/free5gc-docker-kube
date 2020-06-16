#!/bin/bash
[ $(which lsof) ] || apt install lsof
[ $(which iperf3) ] || sudo apt install iperf3

if [ $(lsof -t -itcp:52000) ] 
then
        echo "Process in 52000 port deleted";	
	kill -9 $(lsof -t -itcp:52000);
fi
if [ $(lsof -t -itcp:52001) ] 
then	
        echo "Process in 52001 port deleted";	
	kill -9 $(lsof -t -itcp:52001); 
fi
if [ $(lsof -t -itcp:52002) ] 
then
        echo "Process in 52002 port deleted";	
	kill -9 $(lsof -t -itcp:52002); 
fi
if [ $(lsof -t -itcp:52003) ] 
then
        echo "Process in 52003 port deleted";	
	kill -9 $(lsof -t -itcp:52003); 
fi
iperf3 -s -f K -p 52000 2>&1 & 
iperf3 -s -f K -p 52001 2>&1 & 
iperf3 -s -f K -p 52002 2>&1 & 
iperf3 -s -f K -p 52003 2>&1 &

echo "Servers running on ports: 52000 to 52003";
