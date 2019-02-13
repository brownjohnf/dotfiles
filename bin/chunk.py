#!/usr/bin/env python

from sys import stdin, stdout, exit
from re import sub

for line in stdin:
    clean = line.strip()

    if clean == '':
        print(clean)
        continue

    for i in range(0, len(clean), 4):
        stdout.write(line[i:i+4] + ' ')

    stdout.write('\n')


