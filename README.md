# docker-rathena

[![Docker Build Status](https://img.shields.io/docker/build/kafka/rathena.svg)](https://hub.docker.com/r/kafka/rathena/)
[![](https://images.microbadger.com/badges/image/kafka/rathena.svg)](https://microbadger.com/images/kafka/rathena)
[![](https://images.microbadger.com/badges/version/kafka/rathena.svg)](https://microbadger.com/images/kafka/rathena)

## What is rAthena?

[rAthena](https://rathena.org) is an open-source cross-platform MMORPG server


## How to use this image

```console
$ docker run --link rathena-mysql:mysql -p 127.0.0.1:6900:6900 -p 127.0.0.1:6121:6121 -p 127.0.0.1:5121:5121 --name rathena -d kafka/rathena
```

where rathena-mysql is mysql container with updated rAthena sql database

## User Feedback

### Issues

If you have any problems with or questions about this image, please contact through a [GitHub issue](https://github.com/ofkindness/docker-rathena/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; It is always thrilled to receive pull requests, and process them.

Before you start to code, it is recommend discussing your plans through a [GitHub issue](https://github.com/ofkindness/docker-rathena/issues), especially for ambitious contributions.
