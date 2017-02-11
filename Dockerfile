
FROM alpine:latest

MAINTAINER Bodo Schulz <bodo@boone-schulz.de>

LABEL version="1702-02"

ENV \
  ALPINE_MIRROR="dl-cdn.alpinelinux.org" \
  ALPINE_VERSION="v3.5" \
  TERM=xterm

EXPOSE 6379

# ---------------------------------------------------------------------------------------

RUN \
  echo "http://${ALPINE_MIRROR}/alpine/${ALPINE_VERSION}/main"       > /etc/apk/repositories && \
  echo "http://${ALPINE_MIRROR}/alpine/${ALPINE_VERSION}/community" >> /etc/apk/repositories && \
  apk --no-cache update && \
  apk --no-cache upgrade && \
  apk --quiet add \
    redis && \
  mv /etc/redis.conf /etc/redis.conf-DIST && \
  rm -rf \
    /tmp/* \
    /var/cache/apk/*

COPY rootfs/ /

CMD [ "/usr/bin/redis-server", "/etc/redis.conf" ]

