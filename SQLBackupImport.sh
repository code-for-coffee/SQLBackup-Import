#!/bin/bash
# This script allows you to import and backup MySQL SQL files.
# There are two functions; use them at your will. 
#
# Please make sure the proper variables are edited below.
# 

# MySQL Server Information (Username, Password, Database Name)
MySQLUsr=
MySQLDBName=

# Note - 
# You can automate this script (for a CRON job) and add the following variable.
# MySQLPsswd=
# Make sure you comment out line 26/39 and uncomment line 27/40 if so.

# SQL File to Import
SQLImportFile=/path/to/file.sql

function dbImport {
  if [ -z $MySQLUsr ];
	then
		echo "No MySQL username entered."
	else
		echo "This script will attempt to import a database to " + $MySQLDBName
		echo "You will be prompted for your password."
		mysql -u $MySQLUsr -p $MySQLDBName < $SQLImportFile
		#mysql -u $MySQLUsr -p$MySQLPsswd $MySQLDBName < $SQLImportFile
	fi
	exit
}

function dbBackup {
	if [ -z $MySQLUsr ];
	then
		echo "No MySQL username entered."
	else
		echo "This script will attempt to import a database to " + $MySQLDBName
		echo "You will be prompted for your password."
		mysqldump -u $MySQLUsr -p $MySQLDBName | uuencode mysqldbbackup.sql.gz
		#mysqldump -u $MySQLUsr -p$MySQLPsswd $MySQLDBName | uuencode mysqldbbackup.sql.gz
	fi
	exit
}

# here we actually run the functions.
dbImport
dbBackup
exit
