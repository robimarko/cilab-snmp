#!/usr/bin/env sh

STATION0_COUNT=$(iw dev wlan0 station dump | grep Station | wc -l)
STATION1_COUNT=$(iw dev wlan1 station dump | grep Station | wc -l)

STATION_COUNT=$(($STATION0_COUNT+$STATION1_COUNT))

echo $STATION_COUNT
