From free5gc

COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc.conf
COPY amf.conf /free5gc/install/etc/free5gc/freeDiameter/amf.conf

#só pra salvar em outro lugar
COPY free5gc.conf /free5gc/install/etc/free5gc/free5gc-copy.conf
COPY amf.conf /free5gc/install/etc/free5gc/freeDiameter/amf-copy.conf

EXPOSE 36412

#CMD ./free5gc-amfd
CMD tail -f /dev/null

