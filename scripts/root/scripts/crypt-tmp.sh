#!/bin/bash
#

sleep 30

dd if=/dev/random of=/tmp/crypt-tmp.img bs=1M count=16

mkdir /tmp/crypt

head -c 1000 < /dev/urandom | uuencode -m - | grep -v begin | head -c 128 | cryptsetup -h "sha256" -c "aes-cbc-essiv:sha256" create tmp /tmp/crypt-tmp.img
mkfs.ext4 /dev/mapper/tmp
mount /dev/mapper/tmp /tmp/crypt
chmod 1777 /tmp/crypt

touch /tmp/crypt/test.txt

