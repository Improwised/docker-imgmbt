FROM alpine:3.14
LABEL maintainer='Pratik <pratik@improwised.com>'
ARG MBT_VERSION=v0.24
ARG IMG_VERSION=v0.5.11
ADD https://github.com/mbtproject/mbt/releases/download/${MBT_VERSION}/mbt_linux_x86_64 /usr/bin/mbt
ADD https://github.com/genuinetools/img/releases/download/${IMG_VERSION}/img-linux-amd64 /usr/bin/img
# mbt required libgit2-dev 0.27
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/v3.9/main libgit2-dev=0.27.7-r0 && \
  chmod +x /usr/bin/img /usr/bin/mbt
