# vim:set ft=dockerfile:
FROM alpine:edge

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk add --update tor \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN mkdir -p /var/lib/tor/hidden_service
RUN chmod 700 /var/lib/tor/hidden_service
RUN chown -R tor:nogroup /var/lib/tor/hidden_service

# RUN cp /etc/tor/torrc.sample /etc/tor/torrc
ADD torrc /etc/tor/torrc

EXPOSE 9050

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]