#!/bin/bash
set -e

ffmpeg -re \
  -stream_loop -1 -i rain/video/rain_night.mp4 \
  -stream_loop -1 -i rain/audio/rain.mp3 \
  -map 0:v -map 1:a \
  -c:v copy \
  -c:a aac -b:a 128k \
  -af "aresample=async=1" \
  -f flv "$RAIN_RTMP"
