#!/bin/bash

sleep 5m

KEYDIR=/mnt/key
HOST=`echo $HOSTNAME`
FILEKEY=$HOST".key"

TESTFILE=$KEYDIR/$FILEKEY

while test ! -f "$TESTFILE"; do
  echo "test for key"
  sleep 5m
done

exec screen -S syncthing -d -m sh -c /home/backup/scripts/script-syncthing-loop.sh run

