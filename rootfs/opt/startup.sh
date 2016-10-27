#!/bin/bash
#


if [ ${DEBUG} ]
then
  set -x
fi

REDIS_BIND=${REDIS_BIND:-0.0.0.0}
REDIS_PORT=${REDIS_PORT:-6379}
REDIS_DATABASES=${REDIS_DATABASES:-8}

# -------------------------------------------------------------------------------------------------

createConfig() {

  mv /etc/redis.conf /etc/redis.conf-DIST

  sed \
    -e '/^#/ d' -e '/^;/ d'  -e '/^ *$/ d' \
    /etc/redis.conf-DIST > /etc/redis.conf

  sed -i \
    -e "s/bind 127.0.0.1/bind ${REDIS_BIND}/" \
    -e "s/port 6379/port ${REDIS_PORT}/" \
    -e "s/daemonize yes/daemonize no/" \
    -e "s/pidfile \/var\/run\/redis\/redis.pid/pidfile \/run\/redis.pid/" \
    -e "s/logfile \/var\/log\/redis\/redis.log/logfile \/var\/log\/redis.log/" \
    -e "s/databases 16/databases ${REDIS_DATABASES}/" \
    /etc/redis.conf

}


startSupervisor() {

  echo -e "\n Starting Supervisor.\n\n"

  if [ -f /etc/supervisord.conf ]
  then
    /usr/bin/supervisord -c /etc/supervisord.conf >> /dev/null
  fi
}

# -------------------------------------------------------------------------------------------------

run() {

  createConfig

  startSupervisor

}

run

# EOF
