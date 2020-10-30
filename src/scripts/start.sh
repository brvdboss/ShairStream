#!/bin/sh

#enable syslogd to make sure we capture the logging from shairport-sync
syslogd

#start the ShairPlay server with the original script
/start.sh -vvv $@ &

sleep 5

#start icecast streaming server
icecast -c /ShairStream/Icecast/icecast.xml -b

sleep 5

#create stream
cat /tmp/shairport-sync-audio | lame -b 320 -r - | ezstream -r -c /ShairStream/Ezstream/ezstream-stdin.xml