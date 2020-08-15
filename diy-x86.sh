#!/bin/bash

YEAR=$(date +%y)
MONTH=$(date +%-m)
DAY=$(date +%-d)

mv ./package/greenice/ucl ./tools/
mv ./package/greenice/upx ./tools/
sed -i '30 a\tools-y += ucl upx' ./tools/Makefile

##修改LAN地址、时区
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CTS-8'/g" package/base-files/files/bin/config_generate

##修改root密码
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "/^DISTRIB_REVISION=/cDISTRIB_REVISION='V$YEAR.$MONTH.$DAY By Greenice'" openwrt/package/base-files/files/etc/openwrt_release
# sed -i '/REDIRECT --to-ports 53/d' package/network/config/firewall/files/firewall.user
# echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >> package/network/config/firewall/files/firewall.user
# echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >> package/network/config/firewall/files/firewall.user
