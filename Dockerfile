
FROM alpine:3.6

MAINTAINER Bodo Schulz <bodo@boone-schulz.de>

ENV \
  ALPINE_MIRROR="mirror1.hs-esslingen.de/pub/Mirrors" \
  ALPINE_VERSION="v3.6" \
  TERM=xterm \
  BUILD_DATE="2017-07-08" \
  VERSION="3.2.8"

EXPOSE 6379

LABEL \
  version="1707-27.1" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="redis Docker Image" \
  org.label-schema.description="Inofficial redis Docker Image" \
  org.label-schema.url="https://redis.io/" \
  org.label-schema.vcs-url="https://github.com/bodsch/docker-redis" \
  org.label-schema.vendor="Bodo Schulz" \
  org.label-schema.version=${VERSION} \
  org.label-schema.schema-version="1.0" \
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="GNU General Public License v3.0"

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

ENTRYPOINT [ "/usr/bin/redis-server" ]

CMD [ "/etc/redis.conf" ]

# EOF
