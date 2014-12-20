#!/bin/bash

echo "recording..."
arecord -q -f cd -t wav | ffmpeg -loglevel panic -y -i - -ar 16000 -acodec flac file.flac > /dev/null 2>&1

echo "processing..."
wget -q -U "Mozilla/5.0" --post-file file.flac --header "Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speach-api/v1/recognize?lang=en-us&client=chromium" > stt.txt

echo "you said: "
cat stt.txt

#rm file.flac > /dev/null 2>&1

