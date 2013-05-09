#!/bin/bash                                                       
# @Author: Rafael Gorges                                                        
# @Date: 08/05/2013                                                                                                                                 
# Script for manage backups.
############################################################################


# Script Configurations.
# Put here global configurations.
USER=""
PASSWORD=""
DATABASE=""
DATABASE_DIR_OUTPUT=""
BACKUP_REMOVE_TIME="60"

backuptype(){
	state=0
	clear
	while [ $state -eq 0 ] ; do
		echo "Choose the backup option what you want."
		echo
		echo "1 - Backup a directory."
		echo -e -n "2 - Backup a database.\n> "
		read choose
		case $choose in
			1) directory
				state=1 ;;
			2) database
				state=2 ;;
			*) echo "Invalid Option."
				state=0 ;;
		esac
	done
}

directory(){	

# Perform the backup of directory.
#tar -zcf  /home/backup/backup-$(date '+%d-%m-%Y').tar /var/www/project
#echo "Backup of directory was succeeded!"

}

database(){	
clear
	state=0
	while [ $state -eq 0 ] ; do
		echo -e -n "Choose the database what you want do a backup."
			state=1
		else
			echo "Invalid Option."
			state=0
		fi
	done
# Perform the backup of MySQL database.
#/bin/nice -n 19 /usr/bin/mysqldump -u $USER --password=$PASSWORD --default-character-set=utf8 $DATABASE -c | /bin/nice -n 19 /bin/gzip -9 > $DATABASE_DIR_OUTPUT/$DATABASE-$(date '+%d-%m-%Y').sql.gz
#echo "Backup of database was succeeded!"
}

# Remove backups with some time (days only).
#find /home/backup/ -ctime +$BACKUP_REMOVE_TIME -exec rm -rf {} \;
#echo "Deleted old backups!"
#exit 0

# Keep in the last lines of archive.
log="backup.log"
backupdir=~/.backup
backuptype