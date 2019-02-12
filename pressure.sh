#!/usr/bin/env sh

PRESSURE=$(cat /sys/bus/iio/devices/iio\:device0/in_pressure_input)

echo $PRESSURE
