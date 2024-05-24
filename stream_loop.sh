#!/bin/bash

VIDEO_PATH="/usr/src/app/video.mp4"

curl -H "Content-Type: application/json" \
    -X POST \
    -d '{"content": "[info] Streaming started!"}' \
    $WEBHOOK_URL

# Loop the video and stream it using ffmpeg
while true; do
  echo "Stream started!"
  ffmpeg -loglevel warning -re -i "$VIDEO_PATH" -c:v libx264 -preset veryfast -tune zerolatency -c:a aac -b:a 128k -ac 2 -r 30 -g 60 -vb 1369k -minrate 1369k -maxrate 1369k -bufsize 2730k -ar 44100 -x264-params "nal-hrd=cbr" -vf "scale=1280:720,format=yuv420p,bwdif=mode=send_field:parity=auto:deint=all" -profile:v main -f flv -flvflags no_duration_filesize "$STREAM_URL/$STREAM_KEY"
  if [[ $? -eq 0 ]]; then
    echo "Command succeeded! Restarting stream..."
  else
    echo "Stream interrupted, notifying Discord..."
    curl -H "Content-Type: application/json" \
      -X POST \
      -d '{"content": "[alert] stream interrupted, restarting in 10 seconds..."}' \
      $WEBHOOK_URL

    echo "done!"
  fi
done
