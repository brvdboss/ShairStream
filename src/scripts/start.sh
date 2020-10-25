#!/bin/sh

#start the ShairPlay server with the original script
/start.sh $@ &

#start icecast streaming server
icecast -c /ShairStream/Icecast/icecast.xml -b

#create stream
cat /tmp/shairport-sync-audio | lame -b 320 -r - | ezstream -r -c /ShairStream/Ezstream/ezstream-stdin.xml