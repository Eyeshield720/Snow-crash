#!/bin/bash
while [ 1 ];
do
touch /tmp/level10.txt
rm -f /tmp/level10.txt
ln -s ~/token /tmp/level10.txt
unlink /tmp/level10.txt
done