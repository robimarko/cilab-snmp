#!/usr/bin/env sh

OPENWRT_RELEASE=$(cat /etc/openwrt_release | grep -w "DISTRIB_DESCRIPTION" | cut -d "=" -f2 | sed -e "s/^'//" -e "s/'$//")

echo $OPENWRT_RELEASE
