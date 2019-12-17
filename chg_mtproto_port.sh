#!/bin/bash

config_file="/etc/v2ray/config.json"
bak_config_file="/etc/v2ray/config.json.bak"

file=myport
if [ ! -f "$file" ]; then
 old_port=9999
 echo $old_port > myport
fi

new_port=1

for line in $(cat myport)
do
 old_port=$(($line))
 new_port=$(($new_port+$line))
done

if [ -f "$config_file" ];then
	
	rm -f $config_file
    cp $bak_config_file $config_file
	sed -i "s/new_port/$new_port/" $config_file
	systemctl restart v2ray
	
	firewall-cmd --remove-port=$old_port/tcp --permanent &> /dev/null
	firewall-cmd --add-port=$new_port/tcp --permanent &> /dev/null
	firewall-cmd --reload &> /dev/null

	echo $new_port > myport
	echo "The MTProto port gua le again. The new MTProto port:[$new_port]"
fi

exit 0
