# ShairStream
 Docker setup for converting airplay to mp3 stream

## Goal
This container creates an AirPlay endpoint using Shairport-sync and turns the
audio streamed to this endpoint in an mp3-stream using icecast

This allows to use the standard Airplay features on ios devices to be used to
stream to non-compatible players that do support mp3-streams similar to internet
radio

## Components used:
* Shairport-sync: set up the AirPlay endpoint
* icecast: for streaming the mp3 streams
* Ezstream: to create the actual stream
* lame: to do the mp3 encoding

## Some more details
The pipe output of shairport is used to redirect the audio to a named pipe.
This pipe is read and encoded to mp3 using lame and used as a stdin input for
Ezstream to create the stream and make it available through icecast.
