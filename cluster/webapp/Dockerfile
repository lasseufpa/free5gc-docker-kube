From free5gc

RUN apt-get install -y git-core curl build-essential openssl libssl-dev python

RUN git clone https://github.com/nodejs/node.git

RUN ./configure && make && make install

RUN curl -L https://npmjs.org/install.sh | sudo sh

WORKDIR /free5gc/webui

RUN npm install

CMD npm run dev
