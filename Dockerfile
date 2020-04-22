FROM node:10

ENV HOST localhost
ENV PORT 3000
ENV MEMORYNODE 2048
ENV USE_SSL 0

RUN mkdir -p /gekko && \
    git clone -b stable https://github.com/askmike/gekko.git /gekko

WORKDIR /gekko

RUN npm install --production; \
    # install TA-lib, Redis, PostgreSQL modules
    npm install talib@1.0.2 redis@0.10.0 pg bitfinex-api-node@1.0.2 --production && \
    npm cache clean --force


VOLUME /gekko/history

EXPOSE 3000

EXPOSE 3000
RUN chmod +x /usr/src/app/docker-entrypoint.sh
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]

CMD ["--config", "config.js", "--ui"]
