#!/bin/bash
chk=$(cat /etc/ssh/sshd_config |grep Banner )
if echo "$chk" |grep -v "#Banner" |grep Banner > /dev/null 2> /dev/null
then
local=$(echo "$chk" |grep -v "#Banner" |grep Banner |awk '{print $2}')
echo "O que vc deseja por no banner ?"
read -p ": " banner
echo "$banner" > $local
else
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
service ssh restart > /dev/null 2> /dev/null
service sshd restart > /dev/null 2> /dev/null
banner
fi
exit