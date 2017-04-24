#!/bin/bash

fol=`mtp-folders | grep -oP '(\d+)\W{1,2}\K(\w.+)'`
dia=`echo "$fol" | sed -r ':a;N;$!ba;s/\n/ "" /g'`
dialog --title "select directory" --menu "choose" 20 70 10 "" $dia
