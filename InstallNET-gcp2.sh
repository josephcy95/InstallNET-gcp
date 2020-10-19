#!/bin/bash
set -e
apt-get update
apt-get install -y xz-utils openssl gawk file

gcpinternalIP=$(hostname -I)
echo $gcpinternalIP

gcpgatewayIP=$(ip r | awk '/^def/{print $3}')
echo $gcpgatewayIP

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/josephcy95/InstallNET-gcp/master/InstallNET.sh' && bash InstallNET.sh --ip-addr $gcpinternalIP --ip-mask 255.255.255.0 --ip-gate $gcpgatewayIP -dd 'https://www.googleapis.com/drive/v3/files/1O5IxVFIM_QQLNegejIlOh8aevSrIT5g5?alt=media&key=AIzaSyAbXp6Gu21SKql8AHFb9RWgX36F8Aap5Xw'
