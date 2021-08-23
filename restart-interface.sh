#!/bin/ash
# This file is responsible for restarting the network interface.
# Should be run once OFFLINE state is detected.

INTERFACE="wwan0"

ifdown $INTERFACE

sleep 4

ifup $INTERFACE
