#!/bin/bash

while :
do
  clear
  CLOCK=`lscpu | grep "CPU MHz"`
  TEMP=`sensors | grep Physical`

  # Make sure "dialog" is installed
  dialog --infobox "$CLOCK\n$TEMP\n\nPress [CTRL+C] to stop..." 6 65
  sleep 1
done
