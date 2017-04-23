#!/bin/bash

WPAFILE=/etc/wpa_supplicant.conf

#add delete function for active wpa_supplicant in the future

if [ ! -e $WPAFILE ]; then
  echo "Creating WPA supplicant configuration"
  wpa_passphrase wifiName wifiPassword > $WPAFILE
  #make duplicate wpa_supplicant for this network
fi

echo "Connecting to wifi"
#add way to get interface name from iwconfig.. wlp3s0, run iwconfig to get yours
wpa_supplicant -i wlp3s0 -B -c $WPAFILE

echo "Getting IP address"
dhcpcd
