#!/usr/bin/env sh

MODEL=$(cat /tmp/sysinfo/model)

REVISION=$(cat /etc/device_info | grep -w "DEVICE_REVISION" | cut -d "=" -f2 | sed -e "s/^'//" -e "s/'$//")

echo $MODEL $REVISION
