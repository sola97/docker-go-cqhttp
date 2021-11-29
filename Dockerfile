FROM alpine:latest

LABEL maintainer="sola97 <my@sora.vip> "

ENV GO_CQHTTP_DOWNLOAD_URL  https://github.com/Mrs4s/go-cqhttp/releases/download/v1.0.0-beta8-fix1/go-cqhttp_linux_amd64.tar.gz

RUN apk update && \
    apk add --no-cache tzdata && \
    apk add --no-cache --virtual .build-deps wget && \
    mkdir /app && \
    cd /app && \
    wget --no-check-certificate ${GO_CQHTTP_DOWNLOAD_URL} -qO go-cqhttp.tar.gz && \
    tar -xzvf go-cqhttp.tar.gz && \
    rm go-cqhttp.tar.gz && \
    chmod +x go-cqhttp && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del .build-deps
WORKDIR /app
CMD ["./go-cqhttp"]
  

