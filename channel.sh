#!/usr/bin/env sh

CHANNELS=$(iw dev | grep channel | cut -d " " -f 3 | cut -c2-)

arr=$(echo $CHANNELS | tr " " "\n")

for x in $arr
do
    echo $x
done
