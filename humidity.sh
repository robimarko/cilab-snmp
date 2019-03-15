#!/usr/bin/env sh

HUMIDITY=$(cat /sys/bus/iio/devices/iio\:device0/in_humidityrelative_input)
HUMIDITY_OUT=$(cat /sys/bus/iio/devices/iio\:device1/in_humidityrelative_input)

echo $HUMIDITY
echo $HUMIDITY_OUT