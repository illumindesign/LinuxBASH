#!/bin/sh

>/tmp/http.log

LOG=/var/log/myprogram/resources.log
rm $LOG

echo 'Listening...'
sudo tcpdump 'port 80' -Q out -w /tmp/http.log &

sleep 60
killall tcpdump

echo 'Filtering...'
tcpdump -A -r /tmp/http.log | grep '/path/' | sed -e 's/.*\/path//' | sed 's/ .*//' | sed 's/.*/http:\/\/www.example.com\/path& /' > $LOG

echo 'end.'

#download the resources youve found
sh /home/myprogram/dres.sh >/tmp/dres.log
