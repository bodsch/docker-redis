
FROM bodsch/docker-alpine-base:1612-01

MAINTAINER Bodo Schulz <bodo@boone-schulz.de>

LABEL version="0.9.3"

# ---------------------------------------------------------------------------------------

RUN \
  apk --no-cache update && \
  apk --no-cache upgrade && \
  apk --quiet add \
    redis && \
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

ENTRYPOINT /usr/bin/redis-server 

CMD /etc/redis.conf