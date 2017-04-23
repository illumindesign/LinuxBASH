#!/bin/sh

LOG=/var/log/myprogram/resources.log
RCF=/home/myfolder/

for LINE in $(cat $LOG)
do
  FN=`sed 's/.*\///' <<< $LINE`
  # If we already have the file
  if [ -s "$RCF$FN" ] ; then
    echo "Skipping: $FN"
  else
    echo "Downloading: $LINE"
    wget -q "$LINE" -O "$RCF$FN"
  fi
  #sleep 1
done

#delete log file after use
#rm $LOG
