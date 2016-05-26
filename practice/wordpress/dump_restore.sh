#!/bin/bash

echo "Sleep for 5 seconds in case mysql server is not ready"
sleep 5
cd /tmp
case $1 in
dump)
    echo "Dumping..."
    mysqldump --host mysql --password=$MYSQL_ROOT_PASSWORD wordpress > "$2-$(date +%Y%m%d%H%M%S).sql"
    ;;
restore)
    echo "Restoring..."
    mysql --host mysql --password=$MYSQL_ROOT_PASSWORD --database=wordpress < $2
    ;;
esac
