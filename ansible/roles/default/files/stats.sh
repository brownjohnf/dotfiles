#!/bin/bash

rrdtool graph /home/jfbrown/stats/memory.png DEF:value=/var/lib/collectd/rrd/localhost/load/load.rrd:shortterm:AVERAGE LINE2:value#ff0000 -w 1800 -h 1200 -s end-9hours

