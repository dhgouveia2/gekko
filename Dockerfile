FROM node:10

RUN mkdir -p /gekko && \
    git clone -b stable https://github.com/askmike/gekko.git /gekko

WORKDIR /gekko

RUN npm install --production; \
    # install TA-lib, Redis, PostgreSQL modules
    npm install talib@1.0.2 redis@0.10.0 pg bitfinex-api-node@1.0.2 --production

VOLUME /gekko/history

EXPOSE 3000

CMD ["node", "gekko","--config", "config.js", "--ui"]
