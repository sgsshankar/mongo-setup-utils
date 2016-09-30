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


if [ $# -eq 0 ]
  then
  echo "Usage:"
  echo "./mongodata <host> <port> <db> <user> <password>"
  echo "example: ./mongoinit localhost 27017 local user pass"
fi

if [ -z "$db_host" ]
  then
  db_host="localhost"
fi

if [ -z "$db_port" ]
  then
  db_port="27017"
fi

if [ -z "$db_name" ]
  then
  db_name="local"
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
# Init Data                   
#######################################################################
cd mongofiles
ls -1 *.json | sed 's/.json$//' | while read col; do 
    mongoimport --host $db_host --port $db_port --username $db_user --password $db_pass --db $db_name --authenticationDatabase $db_name --collection $col --file $col.json
done