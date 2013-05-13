#!/bin/bash                                                       
# @Author: Rafael Gorges                                                        
# @Date: 13/05/2013                                                                                                                               
# Script for send backup to a remote host with RSYNC.
############################################################################

DATABASE="teste"
#TABLE="name_of_table"
#TABLE2="name_of_table2"
DB_USER=""
REMOTE_DIR=""
DIR_LOCAL=""
REMOTE_HOST=""
REMOTE_USER=""
PASSWORD=""

# Perform the backup of MySQL database.
/bin/nice -n 19 /usr/bin/mysqldump -u $DB_USER --password=$PASSWORD --default-character-set=utf8 $DATABASE $TABLE $TABLE2 -c | /bin/nice -n 19 /bin/gzip -9 > $DIR_LOCAL/$DATABASE.sql.gz
echo "Backup of database was succeeded!"

# Sending backup with RSYNC.
rsync -avz -e ssh $DIR_LOCAL $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
echo "Backup was sent!"
exit 0
