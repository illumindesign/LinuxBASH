#!/bin/bash

fileids=`mtp-files | grep -Po 'File ID: (\d+)' | cut -d: -f2`
c=`echo "$fileids" | head -n 1`
n=`echo "$fileids" | tail -n 1`

while [ $c -le $n ]
do
  f=`mtp-files | pcregrep -M "File ID: $c\n\W+?Filename: (.+?)\n" | cut -d: -f2 | tail -n 1`
  echo "Copying File ID: '$c', Which is named: $f"
  mtp-getfile $c $f
  (( c++ ))
done 
