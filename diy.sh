#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt Mod By RYJ '" >> /etc/openwrt_release
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/AdguardTeam/AdGuardHome.git package/AdGuardHome
git clone https://github.com/happyzhang1995/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/happyzhang1995/openwrt-adguardhome.git package/openwrt-adguardhome
./scripts/feeds update -a
./scripts/feeds install -a
