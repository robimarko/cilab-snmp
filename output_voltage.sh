#!/usr/bin/env sh

OUTPUT_VOLTAGE=$(cat /sys/class/hwmon/hwmon0/in1_input)

echo $OUTPUT_VOLTAGE
