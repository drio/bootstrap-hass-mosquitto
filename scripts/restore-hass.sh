#!/bin/bash
#
# Extracts a hass backup (created from the ui) into the 
# correct docker-compose service location (dc/hass-config)
#
set -e

tarball=$1

if [ ".$tarball" == "." ];then
  echo "Provide hass tarball backup (as generated via the UI)"
  exit 0
fi

echo "I am going to clean up dc/hass-config <press any key> ... "
echo -ne "press <ENTER> to continue ... "
read FOO

echo "Cleaning current dc/hass-config"
rm -rf dc/hass-config

echo "Extracting tarball: $tarball"
tar zxf $tarball
rm -f backup.json

echo "Extracting tarball within tarball ..."
tar zxf homeassistant.tar.gz

echo "Moving data to dc/hass-config/"
rm -f data/homeassistant.tar.gz
mv data dc/hass-config

echo "Cleaning up"
rm -f homeassistant.tar.gz
