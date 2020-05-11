#! /bin/sh
set -u

protocol="$(echo "$1" | grep :// | sed -e's,^\(.*://\).*,\1,g')"
url=$(echo $1 | sed -e s,$protocol,,g)
user_and_password="$(echo $url | grep @ | cut -d@ -f1)"
password="$(echo $user_and_password | grep : | cut -d: -f2)"
if [ -n "$password" ]; then
  user="$(echo $user_and_password | grep : | cut -d: -f1)"
else
  user="$user_and_password"
fi
host_and_port="$(echo $url | sed -e s,$user_and_password@,,g | cut -d/ -f1)"
port="$(echo $host_and_port | grep : | cut -d: -f2)"
if [ -n "$port" ]; then
  host="$(echo $host_and_port | grep : | cut -d: -f1)"
else
  host="$host_and_port"
fi
database="$(echo $url | grep / | cut -d/ -f2-)"

PGPASSWORD="$password" exec pg_activity -h "$host" -p "$port" -U "$user" -d "$database"
