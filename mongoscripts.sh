#!/bin/sh

#    This is part of mongo-setup-utils by sgsshankar
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


#######################################################################
# variables                     
#######################################################################
db_host=$1
db_port=$2
db_name=$3
db_user=$4
db_pass=$5
script_name=$6


if [ $# -eq 0 ]
  then
 	echo "Usage:"
 	echo "./mongoscripts <host> <port> <user> <password> <script>"
 	echo "example: ./mongoscripts localhost 27017 user pass test"
fi

if [ -z "$db_host" ]
  then
	db_host="localhost"
fi

if [ -z "$db_port" ]
  then
	db_port="27017"
fi

if [ -z "$db_user" ]
  then
	db_user=""
fi

if [ -z "$db_pass" ]
  then
	db_pass=""
fi

#######################################################################
# Execute all scripts                    
#######################################################################

if [ -z "$script_name" ]
  then
    cd mongoscripts
    ls -1 *.js | sed 's/.js$//' | while read scrip; do 
      mongo --host $db_host --port $db_port --username $db_user --password $db_pass --quiet $scrip.js
    done
  else
    cd mongoscripts
    mongo --host $db_host --port $db_port --username $db_user --password $db_pass --quiet $script_name.js
fi

