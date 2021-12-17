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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

# 添加新主题  
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config

# r8152
rm -rf package/lean/r8152/patches/010-compat-skb_mark_not_on_list-was-backported-since-ker.patch
