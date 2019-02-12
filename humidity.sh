#!/usr/bin/env sh

HUMIDITY=$(cat /sys/bus/iio/devices/iio\:device0/in_humidityrelative_input)

echo $HUMIDITY
