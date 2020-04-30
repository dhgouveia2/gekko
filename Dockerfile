FROM node:10

ENV HOST localhost
ENV PORT 3000
ENV DB sqlite
ENV MEMORYNODE 2048
ENV USE_SSL 0

RUN mkdir -p /gekko && \
    git clone -b stable https://github.com/askmike/gekko.git /gekko

WORKDIR /gekko

RUN npm install --production; \
    # install TA-lib, Redis, PostgreSQL modules
    npm install talib@1.0.2 redis@0.10.0 pg bitfinex-api-node@1.0.2 --production && \
    npm cache clean --force

COPY docker-entrypoint.sh .

VOLUME /gekko/history

RUN chmod +x /gekko/docker-entrypoint.sh
ENTRYPOINT ["/gekko/docker-entrypoint.sh"]

CMD ["--config", "config.js", "--ui"]
