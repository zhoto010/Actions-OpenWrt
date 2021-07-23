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

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
openClash_url='https://github.com/vernesong/OpenClash.git'                  # OpenClash包地址
passwall_url='https://github.com/xiaorouji/openwrt-passwall'                  # passwall 地址

echo '添加OpenClash'
git clone $openClash_url package/lean/luci-app-openclash

echo '添加Passwall'
git clone $passwall_url package/passwall
