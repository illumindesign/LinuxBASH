#!/bin/bash

for f in *
do
  #edit this/that before use
  r=$(echo $f | sed --posix "s/this/that/")
  mv "$f" "$r"
done
