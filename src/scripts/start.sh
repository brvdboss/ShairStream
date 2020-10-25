#!/bin/sh

#start the ShairPlay server with the original script
/start.sh $@

#start icecast streaming server
icecast -c /ShairStream/assets/Icecast/icecast.xml -b

#create stream
cat /tmp/shairport-sync-audio | lame -b 320 -r - | ezstream -r -c /ShairStream/assets/Ezstream/ezstream-stdin.xml