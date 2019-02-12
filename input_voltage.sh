#!/usr/bin/env sh

INPUT_VOLTAGE=$(cat /sys/class/hwmon/hwmon1/in1_input)

echo $INPUT_VOLTAGE
