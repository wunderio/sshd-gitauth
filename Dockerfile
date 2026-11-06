FROM alpine:3.24.4

USER root

RUN apk upgrade --no-cache

# Minimum versions fix the password authentication bypass (Alpine advisory 2026-11-05)
RUN apk add --no-cache 'openssh>=10.3_p1-r2' 'openssh-server>=10.3_p1-r2' bash curl
EXPOSE 22

RUN mkdir /etc/ssh/keys

# Copy scripts
COPY gitauth_keys.sh /etc/ssh/
COPY entrypoint.sh /

# Won't use buildkit yet
RUN chmod 755 /etc/ssh/gitauth_keys.sh

ENTRYPOINT ["/entrypoint.sh"]
