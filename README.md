docker-redis
==============

Minimal Image with Redis

# Status
[![Build Status](https://travis-ci.org/bodsch/docker-redis.svg?branch=1702-02)](https://travis-ci.org/bodsch/docker-redis)

# Build

Your can use the included Makefile.

To build the Container: ```make build```

To remove the builded Docker Image: ```make clean```

Starts the Container: ```make run```

Starts the Container with Login Shell: ```make shell```

Entering the Container: ```make exec```

Stop (but **not kill**): ```make stop```

History ```make history```


# Docker Hub

You can find the Container also at  [DockerHub](https://hub.docker.com/r/bodsch/docker-redis/)
