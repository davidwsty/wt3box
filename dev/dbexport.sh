#!/bin/bash

DBNAME=catalog
DBSERVER=localhost
DBPORT=3306

DB_USER=root
DB_PASS=root

echo "Copy $DBNAME to dump(dbexport.sql)..."
mysqldump -u $DB_USER -p$DB_PASS -B -h $DBSERVER -P $DBPORT $DBNAME > dbexport.sql
echo "done!"