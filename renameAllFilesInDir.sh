#!/bin/bash

for f in *
do
  r=$(echo $f | sed --posix "s/this/that/")
  mv "$f" "$r"
done
