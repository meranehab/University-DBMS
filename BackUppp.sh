#!/bin/bash

# Database credentials
DB_USER="MERAN"
DB_PASSWORD="1234"
DB_NAME="MERAN"

TIMESTAMP=$(date '+%Y%m%d_%H%M%S')

# Create backup using expdp (Data Pump)
expdp $DB_USER/$DB_PASSWORD DIRECTORY=data_pump_dir DUMPFILE=backup_$TIMESTAMP.dmp LOGFILE=backup_$TIMESTAMP.log

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully."
else
    echo "Error: Database backup failed."
fi