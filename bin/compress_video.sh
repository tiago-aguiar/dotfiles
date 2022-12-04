#!/bin/sh

pushd $1
for file in ./*; do
    ffmpeg -i "$(basename "$file")" -vcodec libx265 -crf 28 "$2/$(basename "$file").mp4"
done
popd
