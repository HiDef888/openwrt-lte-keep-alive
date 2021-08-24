#!/bin/ash
# Installation script.

{
	echo ""
    echo "NICE ;)"
    echo "There are 2 important steps to finish this setup:"
    echo ""
    echo "1. Make sure this line is in the cron."
    echo "   */20 * * * * $DIR/internet-keep-alive.sh"
    echo ""
    echo "Enjoy!"

    rm install.sh
}

download_files()
{
	DIR=$( cd $(dirname $0) ; pwd -P )
	echo "Downloading files from https://github.com/HiDef888/openwrt-lte-keep-alive ..."
    wget -q --no-check-certificate https://raw.githubusercontent.com/HiDef888/openwrt-lte-keep-alive/master/dns-test.sh -O dns-test.sh && chmod +x dns-test.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/HiDef888/openwrt-lte-keep-alive/master/internet-keep-alive.sh -O internet-keep-alive.sh && chmod +x internet-keep-alive.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/HiDef888/openwrt-lte-keep-alive/master/restart-router.sh -O restart-router.sh && chmod +x restart-router.sh
}

echo ""
echo "OpenWRT Keep-alive scripts."

echo ""
DIR=$( cd $(dirname $0) ; pwd -P )
while true; do
    read -p "This will download the files into $DIR. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
