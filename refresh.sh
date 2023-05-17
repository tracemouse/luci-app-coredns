#!/bin/sh

rm -rf /etc/config/coredns
rm -rf /etc/init.d/coredns
rm -rf /etc/coredns
rm -rf /usr/lib/lua/luci/controller/coredns.lua
rm -rf /usr/lib/lua/luci/view/coredns
rm -rf /usr/lib/lua/luci/model/cbi/coredns
rm -rf /usr/lib/lua/luci/coredns
rm -rf /usr/share/coredns
rm -rf /tmp/luci*
rm -rf /tmp/luci-modulecache
rm -rf /usr/lib/lua/luci/i18n/coredns.zh-cn.lmo

cp ./luci-app-coredns/root/etc/init.d/coredns /etc/init.d/
cp ./luci-app-coredns/root/etc/config/coredns /etc/config/
# cp -a ./luci-app-coredns/root/etc/coredns /etc/
cp -a ./luci-app-coredns/luasrc/controller/coredns.lua /usr/lib/lua/luci/controller/
cp -a ./luci-app-coredns/luasrc/view/coredns /usr/lib/lua/luci/view/
cp -a ./luci-app-coredns/luasrc/model/cbi/coredns /usr/lib/lua/luci/model/cbi/
cp -a ./luci-app-coredns/luasrc/coredns /usr/lib/lua/luci/
cp -a ./luci-app-coredns/root/usr/share/coredns /usr/share/
cp ./luci-app-coredns/root/usr/share/coredns/coredns.zh-cn.lmo /usr/lib/lua/luci/i18n/
cp ./coredns /usr/share/coredns/
chmod +x /etc/init.d/coredns
chmod +x /usr/share/coredns/*.sh
chmod +x /usr/share/coredns/coredns

# rm -rf /usr/bin/coredns
# cp ./luci-app-coredns/root/usr/bin/coredns /usr/bin/coredns
# chmod +x /usr/bin/coredns

# sh /usr/share/coredns/gen_corefile.sh
# nano /usr/share/coredns/Corefile

# ls /usr/lib/lua/luci/model/cbi/coredns/*
# nano /etc/config/coredns

