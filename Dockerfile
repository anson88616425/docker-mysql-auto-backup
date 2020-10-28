FROM alpine:latest
RUN apk add --update mysql-client && rm -rf /var/cache/apk/* 
RUN apk add --update dos2unix
VOLUME /mysql_backups

COPY Shanghai /etc/localtime
COPY mysql_backup.sh /
COPY docker-entrypoint.sh /usr/local/bin/
RUN dos2unix /mysql_backup.sh
RUN dos2unix /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["ash"]