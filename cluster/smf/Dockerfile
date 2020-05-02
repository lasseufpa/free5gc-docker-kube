From free5gc

COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc-lasseconfiguration.conf
COPY smf.conf /free5gc/install/etc/free5gc/freeDiameter/smf-lasseconfiguration.conf
COPY setup-lasse.sh /free5gc

RUN chmod +x /free5gc/setup-lasse.sh

CMD tail -f /dev/null
