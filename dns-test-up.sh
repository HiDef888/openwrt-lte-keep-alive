#!/bin/ash

HOST="8.8.8.8"
WAITFOR=3
TIMES=2

ONLINE=0

ping $HOST -c $TIMES -i $WAITFOR &> /dev/null
pingReturn=$?

if [ $pingReturn -eq 0 ]; then
    # ONLINE
    exit 0
else
    # OFFLINE
    exit 1
fi
