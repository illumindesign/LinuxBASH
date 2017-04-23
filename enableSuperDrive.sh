#!/bin/bash

#make sure "sg3-utils" is installed
sg_raw /dev/sr0 EA 00 00 00 00 00 01
