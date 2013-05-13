#!/bin/bash                                                       
# @Author: Rafael Gorges                                                        
# @Date: 13/05/2013                                                                                                                               
# Script for send backup to a remote host with RSYNC.
############################################################################

DB_USER=""                  # User Name (MySQL/MSSQL/SQLite). 
PASSWORD=""                 # Password for DB_USER.
DATABASE=""                 # Database Name.
#TABLE="name_of_table"      # If you want do a backup of just one or more tables, uncomment this line.
#TABLE2="name_of_table2"    # If you want do a backup of just one or more tables, uncomment this line.
DIR_LOCAL=""                # Location where backup is (Local Host).
REMOTE_HOST=""              # IP Adress of remote host. 
REMOTE_USER=""              # SSH User of remote host.
REMOTE_PASSWORD=""          # Password for REMOTE_USER.
REMOTE_DIR=""               # Location where backup will be saved (Remote Host).

# Perform the backup of MySQL database.
/bin/nice -n 19 /usr/bin/mysqldump -u $DB_USER --password=$PASSWORD --default-character-set=utf8 $DATABASE $TABLE $TABLE2 -c | /bin/nice -n 19 /bin/gzip -9 > $DIR_LOCAL/$DATABASE.sql.gz
echo "Backup of database was succeeded!"

# Sending backup with RSYNC.
rsync -avz -e ssh $DIR_LOCAL $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
echo "Backup was sent to remote host!"
exit 0
