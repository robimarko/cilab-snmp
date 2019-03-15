#!/usr/bin/env sh

TEMPERATURE=$(cat /sys/bus/iio/devices/iio\:device0/in_temp_input)
TEMPERATURE_OUT=$(cat /sys/bus/iio/devices/iio\:device1/in_temp_input)

echo $TEMPERATURE
echo $TEMPERATURE_OUT