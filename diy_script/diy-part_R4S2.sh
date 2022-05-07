#!/bin/bash
#
# Copyright (c) 2019-2020 Jason6111
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/Jason6111/OpenWrt-Personal
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#临时修复
#rm -rf package/boot/arm-trusted-firmware-rockchip-vendor/Makefile
#svn co https://github.com/Jason6111/OpenWrt_Personal/trunk/other/patch1 package/boot/arm-trusted-firmware-rockchip-vendor/

#svn co https://github.com/Jason6111/OpenWrt_Personal/trunk/other/patch target/linux/rockchip/patches-5.15/

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

#ID
sed -i "s/DISTRIB_REVISION='R.*.*.[0-9]/& Compiled by Jason/" package/lean/default-settings/files/zzz-default-settings
sed -i 's/%V, %C/[2022] | by Jason /g' package/base-files/files/etc/banner
sed -i '/logins./a\                                          by Jason' package/base-files/files/etc/profile

# 添加新主题  
rm -rf ./feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config
#临时
#sed -i 's/PKG_HASH.*/PKG_HASH:=skip/' feeds/packages/utils/containerd/Makefile
