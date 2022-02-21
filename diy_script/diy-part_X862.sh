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

#ID
sed -i 's/R.*.*.1/& Compiled by Jason/' package/lean/default-settings/files/zzz-default-settings

# 添加新主题  
rm -rf ./feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git ./feeds/luci/themes/luci-app-argon-config

#恢复主机型号
sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore
