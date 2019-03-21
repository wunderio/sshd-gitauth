FROM alpine:3.7

USER root
RUN apk add --no-cache openssh bash python py-requests py-yaml
EXPOSE 22

RUN mkdir /etc/ssh/keys

# Copy scripts
COPY gitauth_keys.py /etc/ssh/
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
