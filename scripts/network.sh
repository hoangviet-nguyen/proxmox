#!/usr/bin/bash

Interface_Config = "iface vmbr0 inet static
        address  10.10.10.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0

        post-up   echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up   iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o ens3 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o ens3 -j MASQUERADE
"

# make a back up
sudo cp "/etc/hosts /etc/hosts.bak"

# remove the line 127.0.0.1	node01.novalocal
sudo sed -i '/127\.0\.1\.1/d' /etc/hosts

# remove old hosts if match
sudo sed -i '/10\.0\.0\.21/d' /etc/hosts
sudo sed -i '/10\.0\.2\.42/d' /etc/hosts
sudo sed -i '/10\.0\.1\.53/d' /etc/hosts

# append the new hosts
echo "10.0.0.21	node01" | sudo tee -a /etc/hosts
echo "10.0.2.42	node02" | sudo tee -a /etc/hosts
echo "10.0.1.53	node03" | sudo tee -a /etc/hosts

# make the bridge
sudo mkdir /etc/network/interfaces.d
sudo touch /etc/network/interfaces.d/vmbr0
echo $Interface_Config | sudo tee -a /etc/network/interfaces.d/interfaces
