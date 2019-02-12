#!/usr/bin/env sh

OUTPUT_CURRENT=$(cat /sys/class/hwmon/hwmon0/curr1_input)

echo $OUTPUT_CURRENT
