#!/usr/bin/env sh

sysName="$1"
sysContact="$2"
sysLocation="$3"
community="$4"

if [[ -z "${community}" || -z "${sysName}" || -z "${sysContact}" || -z "${sysLocation}" ]]; then
  echo "ERROR: Usage: $0 <sysName> <sysContact> <sysLocation> <community>"
  exit 1
fi

opkg update
opkg install snmpd snmp-mibs ca-certificates unzip

wget https://github.com/robimarko/cilab-snmp/archive/master.zip
unzip master -d /tmp
mv /tmp/cilab-snmp-master/* /etc/snmp

uci set snmpd.@system[-1].sysName=$sysName
uci set snmpd.@system[-1].sysContact=$sysContact
uci set snmpd.@system[-1].sysLocation=$sysLocation
uci set snmpd.public.community=$community
uci set snmpd.@system[-1].sysDescr='MeshWrt'

uci add snmpd exec
uci set snmpd.@exec[-1].name=version
uci set snmpd.@exec[-1].prog=/etc/snmp/version.sh
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.2.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=hardware
uci set snmpd.@exec[-1].prog=/etc/snmp/hw_revision.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.2.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=serial
uci set snmpd.@exec[-1].prog=/etc/snmp/serial.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.2.4

uci add snmpd exec
uci set snmpd.@exec[-1].name=station-count
uci set snmpd.@exec[-1].prog=/etc/snmp/station_count.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.11.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=tx-power
uci set snmpd.@exec[-1].prog=/etc/snmp/tx_power.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.11.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=channels
uci set snmpd.@exec[-1].prog=/etc/snmp/channel.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.11.4

uci add snmpd exec
uci set snmpd.@exec[-1].name=input-voltage
uci set snmpd.@exec[-1].prog=/etc/snmp/input_voltage.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.12.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=input-current
uci set snmpd.@exec[-1].prog=/etc/snmp/input_current.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.12.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=output-voltage
uci set snmpd.@exec[-1].prog=/etc/snmp/output_voltage.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.13.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=output-current
uci set snmpd.@exec[-1].prog=/etc/snmp/output_current.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.13.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=temperature
uci set snmpd.@exec[-1].prog=/etc/snmp/temperature.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.14.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=pressure
uci set snmpd.@exec[-1].prog=/etc/snmp/pressure.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.14.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=humidity
uci set snmpd.@exec[-1].prog=/etc/snmp/humidity.sh   
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.14.3

uci add snmpd exec
uci set snmpd.@exec[-1].name=bms-voltage
uci set snmpd.@exec[-1].prog=/etc/snmp/bms.sh Voltage
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.15.1

uci add snmpd exec
uci set snmpd.@exec[-1].name=bms-current
uci set snmpd.@exec[-1].prog=/etc/snmp/bms.sh Current
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.15.2

uci add snmpd exec
uci set snmpd.@exec[-1].name=bms-temperature
uci set snmpd.@exec[-1].prog=/etc/snmp/bms.sh Temperature
uci set snmpd.@exec[-1].miboid=.1.3.6.1.4.1.51510.15.3

uci commit

echo "*/5 * * * * /etc/snmp/bms.py SNMP" >> /etc/crontabs/root
echo "#This is BMS parser" >> /etc/crontabs/root

/etc/init.d/cron restart
/etc/init.d/cron enable

/etc/init.d/snmpd restart
/etc/init.d/snmpd enable
