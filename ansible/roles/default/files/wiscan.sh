#!/bin/bash

sudo iwlist $1 scan | grep ESSID | awk -F: '{print $2}' | sort

