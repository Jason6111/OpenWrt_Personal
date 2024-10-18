#!/bin/bash
#
# Copyright (c) 2019-2023 Jason6111
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/Jason6111/OpenWrt_Personal
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.66/g' ./package/base-files/files/bin/config_generate

# 日期
sed -i 's/os.date(/&"%Y-%m-%d %H:%M:%S"/' ./package/lean/autocore/files/x86/index.htm

# 关闭串口跑码
sed -i 's/console=tty0//g'  ./target/linux/x86/image/Makefile
sed -i 's/%V, %C/[Year] | by Jason /g' ./package/base-files/files/etc/banner
sed -i "s/Year/$(TZ=':Asia/Shanghai' date '+%Y')/g" ./package/base-files/files/etc/banner
sed -i '/logins./a\                                          by Jason' ./package/base-files/files/etc/profile

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' ./package/lean/default-settings/files/zzz-default-settings

# ID
sed -i "s/DISTRIB_REVISION='R.*.*.[0-9]/& Compiled by Jason/" ./package/lean/default-settings/files/zzz-default-settings

# 主题背景
mkdir -p ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/ && curl -o ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/Network.mp4 https://raw.githubusercontent.com/Jason6111/OpenWrt_Personal/main/other/argon/video/default/Network.mp4

# 恢复主机型号
sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' ./package/lean/autocore/files/x86/autocore
#sed -i 's/(cat \/tmp.*/\{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' ./package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' ./package/lean/autocore/files/x86/autocore

# dockerman
#sed -i 's/+cgroupfs-mount //g' feeds/luci/applications/luci-app-dockerman/Makefile
#sed -i '42i sed -i "/^# the system init finished. By default this file does nothing./a \/etc\/init.d\/cgroupfs-mount disable" \/etc\/rc.local' package/lean/default-settings/files/zzz-default-settings

# 临时
sed -i 's/6.1/6.6/g'  ./target/linux/x86/Makefile
sed -i 's/1.78.0/1.82.0/g' ./feeds/packages/lang/rust/Makefile
sed -i 's/8065824f0255faa3901db8206e6f9423f6f8c07cec28bc6f2797c6c948310ece/1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210/g' ./feeds/packages/lang/rust/Makefile

# zh netdata
rm -rf ./feeds/luci/applications/luci-app-netdata/
git clone https://github.com/Jason6111/luci-app-netdata ./feeds/luci/applications/luci-app-netdata/

# 开启netdata温控监测
sed -i 's/charts\.d = no/charts\.d = yes/g' ./feeds/luci/applications/luci-app-netdata/root/etc/netdata/netdata.conf
