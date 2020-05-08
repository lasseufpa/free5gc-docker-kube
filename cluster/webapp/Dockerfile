From free5gc

RUN apt-get install sudo -y git-core curl build-essential openssl libssl-dev python

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

RUN apt install nodejs

#RUN git clone https://github.com/nodejs/node.git

#WORKDIR /free5gc/node

#RUN ./configure && make && make install

#RUN curl -L https://npmjs.org/install.sh | sudo sh

WORKDIR /free5gc/webui

RUN npm install

EXPOSE 3000

CMD npm run dev
