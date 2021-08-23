# OpenWRT LTE Keep-alive scripts
![OpenWRT logo](https://raw.githubusercontent.com/mchsk/openwrt-lte-keep-alive/assets/images/openwrt.png)
![How it looks](https://raw.githubusercontent.com/mchsk/openwrt-lte-keep-alive/assets/images/screenshot1.png)

**Forked from: https://github.com/mchsk/openwrt-lte-keep-alive - Many Thanks!**<br>
**Special thanks to hazarjast**

**Changes from original.**<br>
1. Switched to ping to relieve netcat dependency.
2. Reduced log-size to save memory <0.5MB.
3. Disconnect/Reconnect modem - instead of wwan iface - on connection failure.
4. Adjusted install script to fit new requirements.

**What is this? Long story short.**<br>
These scripts provide an automated 'keep-alive' ping to maintain your LTE modem connection on the carrier network and, if the connection fails, restarts your modem interface and will eventually reboot your router if needed. You would probably find use of it when you need to have working internet in **locations with difficult access**, e.g. cabin in the woods, garage or your house on Seychelles.

**How it works?**<br>
All the scripts run on [ash](https://www.in-ulm.de/~mascheck/various/ash/) which is the basic shell for OpenWRT.
The main script (`internet-keep-alive.sh`) tries to ping Google DNS servers (8.8.8.8) using [Ping]<br>
- If it fails, it restarts the interface.<br>
- If it fails 4 times in a row, it restarts whole system.<br>
Online/offline results are being logged into `log.txt`, which has a cap of `8000` lines, not to flood the whole space on the device.

**Installation**<br>
1. Log into the router via SSH and go to the directory where you want to keep the script files.<br>
2. Make sure the router is online, then **run the installer using this command** and follow the instructions:<br>
`wget -q --no-check-certificate https://raw.githubusercontent.com/HiDef888/openwrt-lte-keep-alive/master/install.sh -O install.sh && chmod +x install.sh && ./install.sh`
3. Add to crontab: (`internet-keep-alive.sh`)<br>

