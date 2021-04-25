#!/bin/bash

if test "$#" -ne 1; then
    maxdelay=$((3*24*60*60))
    delay=$(($RANDOM%maxdelay))
else
    delay=$1
fi
#echo $delay
sleep $delay

reboot

