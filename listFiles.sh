#!/bin/bash

outputFileList () {
  #LISTFILE=./fileslist.txt << USELESS NOW!!!

  for f in *
  do
    echo "$f" >> $1
  done
  
  echo "Files list has been saved to: $1";
}

outputFileList "$1"
