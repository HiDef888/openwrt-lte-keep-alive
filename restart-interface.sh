#!/bin/ash
# This file is responsible for restarting the network interface.
# Should be run once OFFLINE state is detected.

INTERFACE="wwan0"

echo "SH RESTART IFACE DOWN"
ifdown $INTERFACE

sleep 3

echo "SH RESTART IFACE UP"
ifup $INTERFACE
