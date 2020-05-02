From free5gc

COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf
COPY hss.conf /free5gc/install/etc/free5gc/freeDiameter/hss-lasseconfiguration.conf
COPY setup-lasse.sh /free5gc

RUN chmod +x /free5gc/setup-lasse.sh

#CMD ./nextepc-hssd
CMD tail -f /dev/null
