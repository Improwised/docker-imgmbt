## for multistage build
FROM bitnami/minideb as builder
RUN apt-get update

FROM bitnami/minideb
LABEL maintainer='Pratik <pratik@improwised.com>'
ARG MBT_VERSION=v0.24
ARG IMG_VERSION=v0.5.11
ADD https://github.com/mbtproject/mbt/releases/download/${MBT_VERSION}/mbt_linux_x86_64 /usr/bin/mbt
ADD https://github.com/genuinetools/img/releases/download/${IMG_VERSION}/img-linux-amd64 /usr/bin/img
COPY --from=builder /var/lib/apt/lists/ /var/lib/apt/lists/
RUN apt-get install -y --no-install-recommends libssl-dev ca-certificates && \
  chmod +x /usr/bin/img /usr/bin/mbt
