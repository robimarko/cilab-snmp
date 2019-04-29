#!/usr/bin/env sh

STATION_COUNT=0

WLANS=$(iw dev | grep Interface | cut -d " " -f 2)
arr=$(echo $WLANS | tr " " "\n")
for x in $arr
do
        STATION_COUNT=$((STATION_COUNT+$(iw dev ${x} station dump | grep Station | wc -l)))
done

echo $STATION_COUNT
