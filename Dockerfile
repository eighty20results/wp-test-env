FROM debian:stable-slim

ENV BUILD_DIR /build_env
ENV BASE_DIR /

RUN apt-get update \
	&& apt-get install -y subversion rsync git \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /build_env/bin/

COPY ./build_env/bin/entrypoint.sh /build_env/bin/entrypoint.sh
COPY ./build_env/bin/remove_update.sh /build_env/bin/remove_update.sh

ENTRYPOINT ["/build_env/entrypoint.sh"]
