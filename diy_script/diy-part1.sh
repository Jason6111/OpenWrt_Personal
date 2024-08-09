#!/bin/bash
#
# Copyright (c) 2019-2023 Jason6111
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/Jason6111/OpenWrt_Personal
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# LINUX_VERSION
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(LINUX_VERSION)-/g' include/image.mk

# docker
sed -i 's/ +cgroupfs-mount//g' luci/applications/luci-app-dockerman/Makefile

# Add a feed source
#echo 'src-git helloworld https://github.com/Jason6111/helloworld' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"
