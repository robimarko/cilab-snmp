#!/usr/bin/env sh

TEMPERATURE=$(cat /sys/bus/iio/devices/iio\:device0/in_temp_input)

echo $TEMPERATURE
