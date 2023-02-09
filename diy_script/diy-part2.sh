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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# v2ray_server
# sed -i s/"cp -a"/"ln -s"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/app.lua
# sed -i s/"-config"/"run -config"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/app.lua
# sed -i s/"xray -version"/"xray version"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/v2ray.lua
# sed -i s/"xray -version"/"xray version"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/v2ray.htm

# 日期
sed -i 's/os.date(/&"%Y-%m-%d %H:%M:%S"/' package/lean/autocore/files/x86/index.htm

# 关闭串口跑码
sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile
sed -i 's/%V, %C/[Year] | by Jason /g' package/base-files/files/etc/banner
sed -i "s/Year/$(TZ=':Asia/Shanghai' date '+%Y')/g" package/base-files/files/etc/banner
sed -i '/logins./a\                                          by Jason' package/base-files/files/etc/profile

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

# ID
sed -i "s/DISTRIB_REVISION='R.*.*.[0-9]/& Compiled by Jason/" package/lean/default-settings/files/zzz-default-settings

# 添加新主题  
# rm -rf ./feeds/luci/themes/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config

# 主题背景
svn co https://github.com/Jason6111/OpenWrt_Personal/trunk/other/argon/video/default  ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/
rm -rf ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/.svn/

# 恢复主机型号
#sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i 's/(cat \/tmp.*/\{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# 临时
sed -i s/5.15/6.1/g  target/linux/x86/Makefile
