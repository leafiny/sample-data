#!/bin/bash
dir="$( cd "$( dirname "$0" )" && pwd )/"
backup="database/leafiny_cms.sql"
dbHost="localhost"
dbPort="3306"
dbUser="root"
dbDatabase="leafiny"
dbPassword=""
lyVersion="1.11.0"
lyPath="/var/www/leafiny"

read -p "Leafiny version ($lyVersion): " version

if [ $version ]
then
  lyVersion=$version
fi

dir="${dir}${lyVersion}/"

echo "\n[Import sample database]\n"

read -p "Database host ($dbHost): " host
read -p "Database port ($dbPort): " port
read -p "Database user ($dbUser): " user
read -p "Database name ($dbDatabase): " database

if [ $host ]
then
  dbHost=$host
fi
if [ $port ]
then
  dbPort=$port
fi
if [ $user ]
then
  dbUser=$user
fi
if [ $database ]
then
  dbDatabase=$database
fi

if [ $dbPassword ]
then
  mysql --host=$dbHost --port=$dbPort --user=$dbUser --password=$dbPassword $dbDatabase < ${dir}${backup}
else
  mysql --host=$dbHost --port=$dbPort --user=$dbUser --password $dbDatabase < ${dir}${backup}
fi

echo "\n[Import sample media]\n"

read -p "Leafiny root path directory ($lyPath): " path

if [ $path ]
then
  lyPath=$path
fi

lyPath=$(readlink -m $lyPath)

if [ -d "${lyPath}/media" ]
then
  cp -R -f "${dir}media" "${lyPath}"
  echo "\nMedia files was copied.\n"
else
  echo "\n[Error] There is no media directory in the specified path\n"
fi

echo "\nDone!\n"
