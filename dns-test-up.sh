#!/bin/ash

HOST="8.8.8.8"
WAITFOR=3
TIMES=2

ping $HOST -c $TIMES -i $WAITFOR &> /dev/null
pingReturn=$?

if [ $pingReturn -eq 0 ]; then
    # It works
    echo "Success!!!"
    exit 0
else
    # No access
    echo "Fail"
    exit 1
fi
