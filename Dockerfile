
FROM bodsch/docker-alpine-base:1610-02

MAINTAINER Bodo Schulz <bodo@boone-schulz.de>

LABEL version="0.9.3"

# ---------------------------------------------------------------------------------------

RUN \
  apk --no-cache update && \
  apk --no-cache upgrade

RUN \
  apk --quiet add \
    redis \
    inotify-tools

RUN \
  rm -rf /var/cache/apk/*

COPY rootfs/ /

CMD /bin/bash

# ENTRYPOINT [ '/opt/startup.sh' ]
