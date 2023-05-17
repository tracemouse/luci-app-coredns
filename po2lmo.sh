#!/bin/sh
rm -rf ./luci-app-coredns/root/usr/share/coredns/coredns.zh-cn.lmo
po2lmo ./luci-app-coredns/po/zh-cn/coredns.po ./luci-app-coredns/root/usr/share/coredns/coredns.zh-cn.lmo
