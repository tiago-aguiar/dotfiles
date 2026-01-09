#!/bin/sh

# compress_video.sh <current_folder_with_files> <dest_folder_inside_current_folder_with_files>
# compress_video.sh compose compress

if [ -f $1 ]; then
    echo "compress file..."
    dirname="$(dirname $1)"
    filename=$(basename "$1")
    mkdir -p compress
    echo "$dirname/$filename" -vcodec libx265 -crf 28 "$dirname/compress/$filename"
    ffmpeg -i "$dirname/$filename" -vcodec libx265 -crf 28 "$dirname/compress/$filename"
elif [ -d $1 ]; then
    echo "compress dir..."

    pushd $1
    mkdir -p compress
    for file in ./*; do
	echo "$(basename "$file")" -vcodec libx265 -crf 28 "compress/$(basename "$file")"
	ffmpeg -i "$(basename "$file")" -vcodec libx265 -crf 28 "compress/$(basename "$file")"
    done
    popd
fi

