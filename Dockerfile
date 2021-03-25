FROM alpine:latest

LABEL maintainer="sola97 <my@sora.vip> "

ENV GO_CQHTTP_DOWNLOAD_URL  https://github.com/Mrs4s/go-cqhttp/releases/download/v1.0.0-alpha1/go-cqhttp-v1.0.0-alpha1-linux-amd64 

RUN apk update && \
    apk add --no-cache tzdata &*& \
    apk add --virtual .build-deps wget && \
    wget --no-check-certificate ${GO_CQHTTP_DOWNLOAD_URL} -qO go-cqhttp && \
    chmod +x go-cqhttp && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del .build-deps

CMD ["./go-cqhttp"]
  

