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
sed -i '/REDIRECT --to-ports 53/d' /etc/firewall.user
echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user
echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user
echo "#单臂路由注释上2行，取消下行注释" >> /etc/firewall.user
echo "#iptables -t nat -I POSTROUTING -j MASQUERADE" >> /etc/firewall.user
#单独拉取软件包
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/AdguardTeam/AdGuardHome.git package/AdGuardHome
git clone https://github.com/happyzhang1995/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/happyzhang1995/openwrt-adguardhome.git package/openwrt-adguardhome
./scripts/feeds update -a
./scripts/feeds install -a
