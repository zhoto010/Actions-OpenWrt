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
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'             # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'                  # OpenClash包地址
lienol_url='https://github.com/Lienol/openwrt-package.git'                  # Lienol 包地址
filter_url='https://github.com/destan19/OpenAppFilter.git'                  # AppFilter 地址
passwall_url='https://github.com/xiaorouji/openwrt-passwall'                  # passwall 地址
#删除原默认主题
rm -rf package/lean/luci-theme-argon
#rm -rf package/lean/luci-theme-bootstrap
rm -rf package/lean/luci-theme-material
rm -rf package/lean/luci-theme-netgear

#下载主题luci-theme-argon
git clone https://github.com/YL2209/luci-theme-argon-lr.git package/lean/luci-theme-argon-lr
git clone https://github.com/YL2209/luci-theme-infinityfreedom.git package/lean/luci-theme-infinityfreedom
echo 'CONFIG_PACKAGE_luci-theme-argon-lr=y' >>.config
echo 'CONFIG_PACKAGE_luci-theme-infinityfreedom=y' >>.config
echo '添加主题argon'
git clone $theme_argon package/lean/luci-theme-argon-mc
echo 'CONFIG_PACKAGE_luci-theme-argon-mc=y' >>.config

echo '添加OpenClash'
git clone $openClash_url package/lean/luci-app-openclash

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y' >>.config

echo '添加Passwall'
git clone $passwall_url package/passwall
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y' >>.config

echo '添加Lienol包'
git clone $lienol_url package/Lienol

echo '添加filebrowser'
echo 'CONFIG_PACKAGE_luci-app-filebrowser=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-filebrowser-zh-cn=y' >>.config

echo '添加OpenAppFilter过滤器'
git clone $filter_url package/OpenAppFilter
echo 'CONFIG_PACKAGE_luci-app-oaf=y' >>.config
echo 'CONFIG_PACKAGE_kmod-oaf=y' >>.config
echo 'CONFIG_PACKAGE_appfilter=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y' >>.config
