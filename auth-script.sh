#!/bin/bash
/bin/grep "$1" /data/authorized-keys | cut -d: -f2 | tail -1
