#!/usr/bin/env sh

DEVICES=$(ls -d /sys/bus/iio/devices/*)
arr=$(echo $DEVICES | tr " " "\n")
for x in $arr
do
        echo $(cat ${x}/in_humidityrelative_input)
done
