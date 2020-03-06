#!/bin/bash
mv ./package/greenice/ucl ./tools/
mv ./package/greenice/upx ./tools/
sed -i '30 a\tools-y += ucl upx' ./tools/Makefile

mv target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts target/linux/ramips/dts/bak.mt7621_hiwifi_hc5962.dts
mv ../mt7621_hiwifi_hc5962.dts target/linux/ramips/dts/
mv target/linux/ramips/image/mt7621.mk bak-mt7621.mk
mv ../b70-mt7621.mk target/linux/ramips/image/mt7621.mk

##更换node版本v10
# rm -rf ./feeds/packages/lang/node*
# mkdir ../nodetmp
# git clone https://github.com/project-openwrt/openwrt-node-packages.git ../nodetmp
# mv ../nodetmp/node* ./feeds/packages/lang/

##此处wireguard更新仅针对openwrt-19.07版本
# [ -e "./package/network/services/wireguard" ] && rm -rf ./package/network/services/wireguard
# [ -e "./package/network/utils/wireguard-tools" ] && rm -rf ./package/network/utils/wireguard-tools# 
# mv ./package/greenice/wireguard ./package/network/services/
# mv ./package/greenice/wireguard-tools ./package/network/utils/

##修改LAN地址、时区
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CTS-8'/g" package/base-files/files/bin/config_generate

##修改root密码
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
sed -i "s/DISTRIB_REVISION='%R'/DISTRIB_REVISION='V2020.3.6 By Greenice'/" package/base-files/files/etc/openwrt_release

sed -i '/REDIRECT --to-ports 53/d' package/network/config/firewall/files/firewall.user
echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >> package/network/config/firewall/files/firewall.user
echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >> package/network/config/firewall/files/firewall.user
