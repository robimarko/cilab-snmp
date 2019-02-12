#!/usr/bin/env sh

INPUT_CURRENT=$(cat /sys/class/hwmon/hwmon1/curr1_input)

echo $INPUT_CURRENT
