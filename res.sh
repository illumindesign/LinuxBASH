#!/bin/bash

#echo "Starting X..."
#startx

#Run after X is started to set resolution for all monitors
echo "Generating modeline for 1280x768"
RES=`cvt 1280 768 | tail --lines=1`
s=`expr "$RES" : 'Modeline '`
len=${#RES}
Modeline=${RES:s:len}
Modeline=`sed 's/   / /g' <<< "$Modeline"`
Modeline=`sed 's/  / /g' <<< "$Modeline"`
Modeline=`sed 's/"//g' <<< "$Modeline"`
RES=${Modeline:0:14}
echo "$Modeline" > /tmp/res.log
#echo "$Modeline"
#exit;


echo "Creating new modeline: $RES"
echo `xrandr --newmode $Modeline`
#echo "$Modeline"
#exit

echo "Enumerating displays"
DF=/tmp/displays.log
DIS=`xrandr | grep " connected"`
DISN=`wc -l <<< "$DIS"`
echo "$DIS" > $DF

echo "Cycling $DISN displays:"
for ((a=1 ; a <= $DISN ; a++)) ; do
  CD=`head -$a $DF | tail -1`
  s=`expr index "$CD" ' c'`
  CDN=${CD:0:s-1}
  echo "- Display $a ($CDN)"
  echo "-- $CDN: Adding $RES display mode"
  echo `xrandr --addmode $CDN $RES`
  echo "-- $CDN: Setting resolution"
  echo `xrandr --output $CDN --mode $RES`
  echo "----------------------------------------------------------"
done
