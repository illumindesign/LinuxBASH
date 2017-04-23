#!/bin/bash

mkdir "converted"

# change AVI to whatever
for f in *.avi
do
  o=`basename "$f" .avi`.mp4
  echo "Processing $f into $o"
  ffmpeg -i "$f" -c:v libx265 -c:a copy "./converted/$o"
  rm "$f"
  #break
done

dialog --msgbox "       ALL FILES HAVE BEEN CONVERTED!"  7 50
