FROM alpine:3.15

USER root
RUN apk add --no-cache openssh bash curl
EXPOSE 22

RUN mkdir /etc/ssh/keys

# Copy scripts
COPY gitauth_keys.sh /etc/ssh/
COPY entrypoint.sh /

# Won't use buildkit yet
RUN chmod 755 /etc/ssh/gitauth_keys.sh

ENTRYPOINT ["/entrypoint.sh"]
