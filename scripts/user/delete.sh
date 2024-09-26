#! /usr/bin/bash

# Delete user accounts and kill any processes that are using their directories
sudo pkill -9 -u eval
sudo pkill -9 -u user
sudo deluser eval
sudo deluser user
sleep 2

# remove floating folders
cd /home/
sudo rm -r eval
sudo rm -r user
echo "The following directories in /home"
ls /home
