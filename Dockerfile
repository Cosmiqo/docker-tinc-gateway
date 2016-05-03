FROM alpine:3.3
MAINTAINER Melvin Zhang <melvin@cosmiqo.com>

RUN apk add --update tinc && rm -rf /var/cache/apk/*

EXPOSE 655/tcp 655/udp

ENTRYPOINT ["/usr/sbin/tincd"]
CMD [ "-D", "-U", "nobody", "-d" ]
