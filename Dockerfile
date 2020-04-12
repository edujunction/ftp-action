FROM alpine:3.11

COPY LICENSE README.md /

RUN apk --no-cache add lftp
RUN apk --no-cache add ncftp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
