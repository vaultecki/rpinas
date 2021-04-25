#!/bin/bash

sleep 2m

TMPDIR=/tmp/crypt/
HOMEDIR=~
HOST=`echo $HOSTNAME`
FILEKEY=$HOST".key"

if [ "$HOST" == "test" ];
then
  DEVICES="TODO-uuid","TODO-uuid2"
  startuphost="external"
  #echo $HOST
fi

cd ~

TESTFILE=/tmp/crypt/test.txt

while test ! -f "$TESTFILE"; do
  echo "test for file"
  sleep 5m
done

scp $startuphost:~/key/$FILEKEY $TMPDIR/$FILEKEY

for i in $DEVICES; do
  sudo cryptsetup luksOpen /dev/disk/by-uuid/$i $i --key-file $TMPDIR/$FILEKEY
done

sudo mount -o noexec,nosuid,nodev /dev/mapper/$i /mnt/

cd ~

