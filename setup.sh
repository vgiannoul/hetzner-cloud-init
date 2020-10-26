#!/bin/bash

sed -i 's/[#]*PermitRootLogin yes/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

systemctl restart sshd

curl -o /usr/local/sbin/apt-get https://raw.githubusercontent.com/vgiannoul/hetzner-cloud-init/main/apt-get

chmod +x /usr/local/sbin/apt-get

apt-get update
apt-get install -y ufw nfs-common open-iscsi


wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x jq-linux64
mv jq-linux64 /usr/local/bin/jq


# curl -o /usr/local/bin/update-config.sh https://raw.githubusercontent.com/vgiannoul/hetzner-cloud-init/master/update-config.sh

# chmod +x /usr/local/bin/update-config.sh
