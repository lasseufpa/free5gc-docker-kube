From free5gc

COPY free5gc.conf /usr/src/free5gc/install/etc/free5gc/free5gc.conf
COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

COPY iptables.sh /root/iptables.sh
RUN chmod +x /root/iptables.sh

CMD /root/setup.sh; /root/iptables.sh; /usr/src/free5gc/free5gc-upfd
CMD tail -f /dev/null
