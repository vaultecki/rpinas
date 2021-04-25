#!/bin/bash
#

if test "$#" -ne 1; then
    maxdelay=$((6*60*60))
    delay=$(($RANDOM%maxdelay))
else
    delay=$1
fi

#echo $delay
sleep $delay

yes | pacman -Scc
pacman -Syu --noconfirm

