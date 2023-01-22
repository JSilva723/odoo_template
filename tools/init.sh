#!/usr/bin/env bash

# Check if exist .env file, if exist show message.
FILE=${PWD}/.env
if test -f "$FILE"; then
    echo '********************************************************************************************'
    echo '*                                                                                          *'
    echo '* This project already started, pleace REMOVE .env file and execute make init for RESTART. *'
    echo '*                                                                                          *'
    echo '********************************************************************************************'
    exit 0
fi

# If .env file don't exist, ask the names for he.
echo '*******************************************************************************************'
echo '*                                                                                         *'
echo '*            To create the .env file and set values in the odoo.conf file                 *'
echo '*            Enter the project name (by default it uses the parent foldername)            *'
echo '*            Enter the database name (cannot be empty)                                    *'
echo '*                                                                                         *'
echo '*******************************************************************************************'
echo -n "Project name(${PWD##*/}): "
read -r projectName

if [[ $projectName == '' ]];
then
    projectName="${PWD##*/}"
fi

echo -n "Database name: "
read -r dbName

while [[ $dbName == '' ]]
do
    echo "Database name cannot be empty"
    echo -n "Database name: "
    read -r dbName
done

# Create .env file.
touch .env

# Set values in .env file.
echo "PROJECT_NAME=$projectName" >> ${PWD}/.env
echo "DB_NAME=$dbName" >> ${PWD}/.env

# Search "db_name" in to odoo.conf file.
CURRENT_DB_NAME_LINE=$(grep "db_name =" ${PWD}/tools/odoo-conf/odoo.conf)

# Replace line in odoo.conf file. 
sed -i "s/$CURRENT_DB_NAME_LINE/db_name = $dbName/" ${PWD}/tools/odoo-conf/odoo.conf