From free5gc

RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -y nodejs

WORKDIR /usr/src/free5gc/webui

RUN npm install

CMD npm run dev
