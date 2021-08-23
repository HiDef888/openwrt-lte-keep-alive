#!/bin/ash
# This file is responsible for restarting the network interface.
# Should be run once OFFLINE state is detected.

INTERFACE="/dev/ttyUSB2"

echo "SH RESTART IFACE DOWN"
echo -e "AT+CGATT=0\r\n" > $INTERFACE

sleep 30

echo "SH RESTART IFACE UP"
echo -e "AT+CGATT=1\r\n" > $INTERFACE

sleep 120

#Particular use-case for me, interface change wipes my crontab
#cat /etc/crontabs/root > /tmp/etc/crontabs/root
