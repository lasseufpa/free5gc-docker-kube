From mongo

COPY setup.sh /root/setup.sh
WORKDIR /root
RUN mongod &>/dev/null &
RUN chmod +x setup.sh
RUN /root/setup.sh

CMD tail -f /dev/null

