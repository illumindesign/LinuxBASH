#!/bin/bash

STATUS=`iw dev wlp13s0 scan | grep VoCore`
COUNT=`cat count.txt`

if [[ -z $STATUS ]] ; then
  dialog --infobox "OFFLINE! Recorded $COUNT seconds of activity" 3 50
else
  echo -n `expr $(cat count.txt) + 1` > count.txt
  dialog --infobox "Online for $COUNT seconds" 3 30
fi

sleep 1

sh count.sh
