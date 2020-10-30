#!/bin/bash
set -e
apt-get update
apt-get install -y xz-utils openssl gawk file

gcpinternalIP=$(hostname -I)
echo $gcpinternalIP

gcpgatewayIP=$(ip r | awk '/^def/{print $3}')
echo $gcpgatewayIP

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/josephcy95/InstallNET-gcp/master/InstallNET.sh' && bash InstallNET.sh --ip-addr $gcpinternalIP --ip-mask 255.255.255.0 --ip-gate $gcpgatewayIP -dd 'https://mirrors.yuntu.ca/teddysun/en_windows2019.gz'
