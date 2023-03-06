#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

########### 修改默认 IP ###########
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

########### 设置密码为空（可选） ###########
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

########### 更新smartdns版本 ###########
#rm -rf feeds/packages/net/smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
#sed -i "/^PKG_VERSION:=/cPKG_VERSION:=1.2022.40" feeds/packages/net/smartdns/Makefile
#sed -i "/^PKG_SOURCE_VERSION:=/cPKG_SOURCE_VERSION:=b473b9c6e101f89ec302c7e080fa7f6bd59ca618" feeds/packages/net/smartdns/Makefile
#sed -i "s/PKG_MIRROR_HASH/#PKG_MIRROR_HASH/" feeds/packages/net/smartdns/Makefile
#sed -i "51i     \$(INSTALL_DIR) \$(1)/etc/smartdns \$(1)/etc/smartdns/domain-set \$(1)/etc/smartdns/conf.d/" feeds/packages/net/smartdns/Makefile
########### 更新adguardhome版本###########
#rsync -rtv --delete package/greenice/adguardhome/ feeds/packages/net/adguardhome

########### 更新xray-core版本###########
#rsync -rtv --delete package/greenice/xray-core/ feeds/packages/net/xray-core
