#!/bin/bash

#replace 'wlp13s0' with your own device
iw dev wlp13s0 scan | grep SSID
