#!/usr/bin/env python3

import serial
import json
import sys

command = sys.argv[1]

ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=2)
ser.write(b'stat')
stat = ser.readline()
class Test(object):
    def __init__(self, data):
	    self.__dict__ = json.loads(data)
json_data = Test(stat)
json_dict = json.loads(stat)

if command == 'Version':
	print(json_data.Version)
elif command == 'Temperature':
	print(json_data.Temperature)
elif command == 'Voltage':
	print(json_data.BattVoltage)
elif command == 'Cell1':
	print(json_data.Cell1)
elif command == 'Cell2':
	print(json_data.Cell2)
elif command == 'Cell3':
	print(json_data.Cell3)
elif command == 'Current':
	print(json_data.Current)
elif command == 'SYS_STAT':
	print(json_data.SYS_STAT)
elif command == 'CELLBAL1':
	print(json_data.CELLBAL1)
elif command == 'SYS_CTRL1':
	print(json_data.SYS_CTRL1)
elif command == 'SYS_CTRL2':
	print(json_data.SYS_CTRL2)
elif command == 'PROTECT1':
	print(json_data.PROTECT1)
elif command == 'PROTECT2':
	print(json_data.PROTECT2)
elif command == 'PROTECT3':
	print(json_data.PROTECT3)
elif command == 'OV_TRIP':
	print(json_data.OV_TRIP)
elif command == 'UV_TRIP':
	print(json_data.UV_TRIP)
elif command == 'CC_CFG':
	print(json_data.CC_CFG)
elif command == 'CC_HI':
	print(json_data.CC_HI)
elif command == 'CC_LO':
	print(json_data.CC_LO)
elif command == 'ADCGAIN1':
	print(json_data.ADCGAIN1)
elif command == 'ADCOFFSET':
	print(json_data.ADCOFFSET)
elif command == 'ADCGAIN2':
	print(json_data.ADCGAIN2)
elif command == 'Dump':
	with open('/tmp/bms-dump.json', 'w') as json_file:  
		json.dump(json_dict, json_file)
		json_file.close()
elif command == 'SNMP':
	with open('/tmp/bms.json', 'w') as json_file:  
		json_file.write('Voltage: {0}\n'.format(json_data.BattVoltage))
		json_file.write('Current: {0}\n'.format(json_data.Current))
		json_file.write('Temperature: {0}\n'.format(json_data.Temperature))
		json_file.close()