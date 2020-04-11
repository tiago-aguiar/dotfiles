#!/bin/bash

FILE=$1
TITLE=$2

echo "creating html..."
nvim -e $FILE -c "set nobackup" -c ":colorscheme gruvbox" -c :TOhtml -c wq -c :q

echo "creating html to pdf..."
wkhtmltopdf --quiet --dpi 1200 test.kt.html test.ps

echo "ghostscript pdf..."
gs -q -dBATCH -dNOPAUSE -dSAFER -dNOPROMPT -sDEVICE=png16m -dDEVICEXRESOLUTION=600 -dDEVICEYRESOLUTION=600 -dDEVICEWIDTH=600 -dDEVICEHEIGHT=600 -dNOPLATFONTS -dTextAlphaBits=4 -sOutputFile=test.png test.ps

echo "saving original file..."
cp test.png test.orig.png

echo "trim file with background..."
convert -trim +repage -trim +repage -bordercolor "#262626" -border 50x100 test.orig.png test.png

echo "creating title..."
convert \
	-size 5000x800 \
	canvas:none \
	-font Ubuntu \
	-pointsize 135  \
	-annotate +100+100 "$TITLE" \
	-channel RGBA \
	-blur 0x6 \
	-fill white \
	-stroke white \
	-annotate +100+100 "$TITLE" \
	fuzzy-magick.png

echo "trim title..."
convert -trim +repage -trim +repage fuzzy-magick.png fuzzy-magick-dest.png

echo "title png to jpg..."
convert fuzzy-magick-dest.png -background "#262626" -bordercolor "#262626" -border 50x50 -flatten tt.jpg

echo "append title with content..."
convert -background "#262626" -append tt.jpg test.png result.jpg

echo "resize to 1080..."
convert result.jpg -resize 1080x1080\> result_resized.jpg

echo "clean folder..."
rm fuzzy-magick-dest.png fuzzy-magick.png output.jpg result.jpg result.png test.java.html test.kt.html test.orig.png test.png test.ps tt.jpg tt.png
