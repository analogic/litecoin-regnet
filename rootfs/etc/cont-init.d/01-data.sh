#!/bin/sh

if [ ! -d /data/node-1 ]; then
    mkdir /data/node-1
fi

if [ ! -d /data/node-2 ]; then
    mkdir /data/node-2
fi

rm /root/.litecoin 2> /dev/null
ln -s /etc/conf/node-1 /root/.litecoin