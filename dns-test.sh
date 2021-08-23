#!/bin/ash
# This file is responsible for DNS check. The return value of its process
# determines the ONLINE/OFFLINE state.

HOST="8.8.8.8"
WAITFOR=3
TIMES=2

ping $HOST -c $TIMES -i $WAITFOR &> /dev/null
pingReturn=$?

if [ $pingReturn -eq 0 ]; then
    # ONLINE
    exit 0
else
    # OFFLINE
    exit 1
fi
