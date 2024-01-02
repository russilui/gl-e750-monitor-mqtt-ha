#!/bin/bash

# debug
#echo "Name of the script: $0"
#echo "Total number of arguments: $#"
#echo "Values of all the arguments: $@"

# If message is longer than two characters then it is an alert message, otherwise it is MCU data
message=$1
if [[ ${#message} -gt 2 ]]; then mosquitto_pub -h "Your Broker Address" -u "Your Broker User" -P "Your Password" -t openwrt/alert -m "${message}"; else
# Check arguments and pubish to mosquitto broker
if [[ -z $TEMP || $TEMP = '' ]]; then TEMP="$1" && mosquitto_pub -h "Your Broker Address" -u "Your Broker User" -P "Your Password" -t openwrt/mcu_t -m "${TEMP}"; fi
if [[ -z $BAT || $BAT = '' ]]; then BAT="$2" && mosquitto_pub -h "Your Broker Address" -u "Your Broker User" -P "Your Password" -t openwrt/mcu_b -m "${BAT}"; fi
if [[ -z $CHARGE || $CHARGE = '' ]]; then CHARGE="$3" && mosquitto_pub -h "Your Broker Address" -u "Your Broker User" -P "Your Password" -t openwrt/mcu_c -m "${CHARGE}"; fi
fi

#debug
#echo "MCU Temperature: ${TEMP}°C"
#echo "Battery SoC: ${BAT}%"
#echo "Charging: ${CHARGE}"
