#!/usr/bin/env sh

SERIAL=$(ifconfig eth0 | sed -n -e 's/^.*HWaddr //p')

echo $SERIAL
