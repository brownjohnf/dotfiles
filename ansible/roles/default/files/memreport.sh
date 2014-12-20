#!/bin/bash

hostname=$(hostname)

while [ true ]
do
  timestamp=`date +%s`

  mem_free=`free | grep Mem | awk '{print $4}'`
  mem_used=`free | grep Mem | awk '{print $3}'`
  load=`cat /proc/loadavg | awk '{print $1}' | sed s/\..*//`

  key="system:memory:free:$hostname"
  value="{\"timestamp\":$timestamp,\"value\":$mem_free,\"meta\":{\"name\":\"FreeMemory\"}}"
  echo "Sending '$value'"
  curl -L "http://aegisgo.com/api/v1/stats" -XPOST -d key=$key -d value=$value

  key="system:memory:used:$hostname"
  value="{\"timestamp\":$timestamp,\"value\":$mem_used,\"meta\":{\"name\":\"UsedMemory\"}}"
  echo "Sending '$value'"
  curl -L "http://aegisgo.com/api/v1/stats" -XPOST -d key=$key -d value=$value

  key="system:load:$hostname"
  value="{\"timestamp\":$timestamp,\"value\":$load,\"meta\":{\"name\":\"SystemLoad\"}}"
  echo "Sending '$value'"
  #curl -L "http://aegisgo.com:3000/api/v1/stats" -XPOST -d key=$key -d value=$value

  sleep 30
done

