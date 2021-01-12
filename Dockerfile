FROM ubuntu:latest

ENV REDIS_VERSION=6.0.9
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install build-essential git libssl-dev pkg-config -y

RUN git clone https://github.com/redis/redis.git -b $REDIS_VERSION /tmp/redis

RUN cd /tmp/redis && make BUILD_TLS=yes && make install

RUN rm -rf /tmp/redis && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/bin/redis-cli" ]
