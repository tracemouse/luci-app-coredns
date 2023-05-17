#!/bin/sh
PO_FILE=luci-app-coredns/po/zh-cn/coredns.po
TMP_PO_FILE=coredns.tmp.po
LUA_FOLDER=luci-app-coredns/luasrc/


replace_lua() {
    # echo $1
    old=`echo "${1}"|sed 's/\//\\\\\//g'`
    old=`echo "${old}"|sed 's/(/\\\\(/g'`
    old=`echo "${old}"|sed 's/)/\\\\)/g'`
    # echo $old
    new=`echo "${2}"|sed 's/\//\\\\\//g'`
    new=`echo "${new}"|sed 's/(/\\\\(/g'`
    new=`echo "${new}"|sed 's/)/\\\\)/g'`
    # echo $new
    find $LUA_FOLDER -name "*.lua" -type f | xargs perl -pi -e"s/\(\"${old}\"/\(\"${new}\"/g"
    find $LUA_FOLDER -name "*.htm" -type f | xargs perl -pi -e"s/\<%:${old}%\>/\<%:${new}%\>/g"
}

rm -rf $TMP_PO_FILE

IFS=$'\n'
for line in `cat $PO_FILE`
do
    if [[ "$(echo $line | grep "msgid")" != "" ]]
    then
        cmd_str=${line/ /=}
        eval $cmd_str
    fi

    if [[ "$(echo $line | grep "msgstr")" != "" ]]
    then
        cmd_str=${line/ /=}
        eval $cmd_str
        replace_lua $msgid $msgstr
        echo "msgid \"${msgstr}\"" >> $TMP_PO_FILE
        echo "msgstr \"${msgid}\"" >> $TMP_PO_FILE
        echo "" >> $TMP_PO_FILE
    fi

done
