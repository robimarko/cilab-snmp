#!/usr/bin/env sh

TX_POWERS=$(iw dev | grep txpower | cut -d " " -f 2)

arr=$(echo $TX_POWERS | tr " " "\n")

for x in $arr
do
    echo $x
done
