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

# rm -rf package/greenice/passwallpackages/gn
# rm -rf package/greenice/passwallpackages/naiveproxy

rm -rf package/network/services/omcproxy
rsync -rtv --delete package/greenice/omcproxy/ package/network/services/omcproxy
rm package/greenice/omcproxy

rm -rf package/kernel/r8125
# rsync -rtv --delete package/greenice/passwallpackages/r8125/ package/kernel/r8125
rsync -lrtv --delete package/greenice/r8125/ package/kernel/r8125

# svn export https://github.com/greenice897/gipackages/trunk/omcproxy package/network/services/omcproxy
# rm -rf package/greenice/passwallpackages/sing-box

rm -rf feeds/packages/net/sing-box
rsync -rtv --delete package/greenice/passwallpackages/sing-box/ feeds/packages/net/sing-box
# rm -rf package/kernel/r8125
# rsync -lrtv --delete package/greenice/r8125/ package/kernel/r8125

# rsync -rtv --delete package/greenice/sing-box/  package/greenice/passwallpackages/sing-box
# rsync -rtv --delete package/greenice/sing-box/ feeds/packages/net/sing-box
# svn export https://github.com/greenice897/gipackages/trunk/sing-box feeds/packages/net/sing-box
# svn export https://github.com/greenice897/gipackages/trunk/sing-box package/greenice/passwallpackages/sing-box

########### 更新smartdns版本 ###########
rm -rf feeds/packages/net/smartdns
git clone -b Release46.1 https://github.com/pymumu/smartdns.git feeds/packages/net/smartdns
# sed -i "s/PKG_VERSION:=1.2024.45/PKG_VERSION:=1.2024.46/" feeds/packages/net/smartdns/Makefile
# sed -i "/^PKG_SOURCE_VERSION:=/cPKG_SOURCE_VERSION:=b969ee66dffbb0d8c400e04244f151ca9f01b064" feeds/packages/net/smartdns/Makefile
# sed -i "s/PKG_MIRROR_HASH/# PKG_MIRROR_HASH/" feeds/packages/net/smartdns/Makefile
rm -rf feeds/luci/applications/luci-app-smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
# sed -i "s/PKG_VERSION:=1.2024.45/PKG_VERSION:=1.2024.46/" feeds/luci/applications/luci-app-smartdns/Makefile
########### 更新adguardhome版本###########
#rsync -rtv --delete package/greenice/adguardhome/ feeds/packages/net/adguardhome

########### 更新xray-core版本###########
sed -i "s/PKG_VERSION:=25.3.3/PKG_VERSION:=25.2.21/" /package/greenice/passwallpackages/xray-core/Makefile
sed -i "s/PKG_HASH:=790066598dbef29fac5cd444dbb476c03975d28509bc6900ad855167bc8696b2/PKG_HASH:=a565db518d2da12fabb74e123d9bf2bdbc34420b81373938f8fcbc7004fda3ba/" /package/greenice/passwallpackages/xray-core/Makefile

rsync -rtv --delete package/greenice/passwallpackages/xray-core/ feeds/packages/net/xray-core
rsync -rtv --delete package/greenice/passwallpackages/microsocks/ feeds/packages/net/microsocks
# rsync -rtv --delete package/greenice/passwallpackages/sing-box/ feeds/packages/net/sing-box
rsync -rtv --delete package/greenice/passwallpackages/v2ray-core/ feeds/packages/net/v2ray-core
rsync -rtv --delete package/greenice/passwallpackages/v2ray-geodata/ feeds/packages/net/v2ray-geodata
