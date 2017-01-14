
FROM bodsch/docker-alpine-base:1701-02

MAINTAINER Bodo Schulz <bodo@boone-schulz.de>

LABEL version="1.0.0"

EXPOSE 6379

# ---------------------------------------------------------------------------------------

RUN \
  apk --no-cache update && \
  apk --no-cache upgrade && \
  apk --quiet add \
    redis && \
  mv /etc/redis.conf /etc/redis.conf-DIST && \
  apk del --purge \
    build-base \
    supervisor \
    bash \
    nano \
    curl \
    ca-certificates \
    ruby-dev \
    ruby-io-console \
    tree && \
  rm -rf /var/cache/apk/*

COPY rootfs/ /

CMD [ "/usr/bin/redis-server", "/etc/redis.conf" ]

