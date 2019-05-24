#!/usr/bin/env sh

command="$1"

if [[ -z "${command}" ]]; then
  echo "ERROR: Usage: $0 <command>"
  exit 1
fi

BMS_VOLTAGE=$(cat /tmp/bms.json | grep Voltage | cut -d " " -f 2)
BMS_CURRENT=$(cat /tmp/bms.json | grep Current | cut -d " " -f 2)
BMS_TEMPERATURE=$(cat /tmp/bms.json | grep Temperature | cut -d " " -f 2)

if [[ $command == "Voltage" ]]; then
	echo $BMS_VOLTAGE
elif [[ $command == "Current" ]]; then
	echo $BMS_CURRENT
elif [[ $command == "Temperature" ]]; then
	echo $BMS_TEMPERATURE
fi