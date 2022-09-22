#! /bin/bash

if [[ $(ip addr | grep tun0 | grep inet | grep 10. | tr -s ' ' | cut -d ' ' -f 3 | cut -d '/' -f 1) ]]; then
	pkexec systemctl stop openvpn@htb.service
else
	pkexec systemctl start openvpn@htb.service
fi
