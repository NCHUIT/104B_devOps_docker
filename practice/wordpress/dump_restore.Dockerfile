
FROM mariadb

COPY dump_restore.sh /usr/local/bin/dump_restore
RUN chmod +x /usr/local/bin/dump_restore

