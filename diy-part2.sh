#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# https://github.com/yfdoor/OpenWrt/blob/master/.github/workflows/OpenWrt-Build.yml
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/10.2.2.5/g' package/base-files/files/bin/config_generate

# kms server
# 'tree/master' --> 'trunk'
svn checkout https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/luci-app-vlmcsd
svn checkout https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/vlmcsd

#luci-app-arpbind
svn checkout https://github.com/kiddin9/openwrt-packages/trunk/applications/luci-app-arpbind package/luci-app-arpbind

#ddns-scripts_dnspod
svn checkout  https://github.com/immortalwrt/packages/trunk/net/ddns-scripts_dnspod  package/ddns-scripts_dnspod  && svn revert -R package/ddns-scripts_dnspod

#openclash packages
git clone -b master  https://github.com/vernesong/OpenClash.git package/luci-app-openclash

#passwall package 
git clone  https://github.com/xiaorouji/openwrt-passwall.git  package/passwall
git clone -b luci  https://github.com/xiaorouji/openwrt-passwall.git  package/luci-app-passwall

#helloworld package
git clone -b master  https://github.com/fw876/helloworld.git  package/helloworld
#for i in "dns2socks" "microsocks" "ipt2socks" "pdnsd-alt"  "redsocks2"; do \
#  svn checkout "https://github.com/immortalwrt/packages/trunk/net/$i" "package/helloworld/$i"; \
#done
svn checkout https://github.com/immortalwrt/packages/trunk/net/redsocks2  package/helloworld/redsocks2

# luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

#CDN speedtest package
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/luci-app-cloudflarespeedtest
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git package/cdnspeedtest

#update golang
pushd feeds/packages/lang
rm -rf golang && svn co https://github.com/openwrt/packages/trunk/lang/golang
popd

#luci-app-pushbot
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot

# ServerChan 微信推送
git clone -b master --depth 1 https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# 流量监视 needby serverchan and pushbot
git clone -b master --depth 1 https://github.com/brvphoenix/wrtbwmon.git package/wrtbwmon
git clone -b master --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/luci-app-wrtbwmon

# luci-app-oaf
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
