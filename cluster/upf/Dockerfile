From free5gc

COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf
COPY setup-lasse.sh /free5gc
COPY script-multiple-server.sh /free5gc

COPY setup.sh /root/setup.sh
COPY iptables.sh /root/iptables.sh

RUN chmod +x /root/setup.sh
RUN chmod +x /root/iptables.sh
RUN chmod +x /free5gc/setup-lasse.sh

CMD /root/setup.sh; /root/iptables.sh; 
CMD tail -f /dev/null
