#! /usr/bin/bash

# create user eval
sudo useradd -m -s /bin/bash eval
sudo usermod -aG sudo eval
echo "User eval has been created"

# create user user
sudo useradd -m -s /bin/bash user
sudo usermod -aG sudo user
echo "user:pass" | sudo chpasswd
echo "User user has been created"

# allow eval and user to have passwordless sudo
echo "eval   ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
echo "user   ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# add the ssh-keys to to eval
cd /home/eval
sudo mkdir .ssh
sudo touch .ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKMf2NalRNgiv1bPjzF+4R4bak81D4SP7vvb0F7KeE7D sebastiangraf@laptop" >> .ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9MXxKVCY705/EmEoF080qJhaGNxRhcDHgv2/RFGm9OBiglKX1psDnmZ9xGPPHjSk38AbOYbNADP3ST3UdnIoIZpVjriCg7F/mo3QCmjPXtD4guLBTzSSjznJxIsSuKY5K/vwHvesdiICXa61W0H8qdiFFa891jEGR7IeBmxA8XgolEMZlSYw4jwzU5U/2dtZWcduh/eH8BjnIVg+IyG+IQhg2BkBqgUcQ/SY2W1U6fg0iqgzKZpgGGp8sMkNwK/xrKj47cyY2Li/27bpI/dbmXogTzdKUKkQ52x6N+8n0I4Kp/jXY7OqpYYlQaM/fnFxOE/EcXHS6xVGI23uUBDfKmu+r3oS9UxSwNpc0B1YvFM8GBbD/538IOwsAwDZZramXq2xQW4xhDzH5mraha7EdPGS11W9thY1jzpf8uoJPAjRnJLiu0ljQ6vkYOG+McKqVh5gW3t7iS4L9NWl/RmoelM8MKL6ktWbDLUNqehDd81tXH75hB6+EJ/d5DwXLVs8= viety@Hoang-Viet" >> .ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsE5QeOCdbUvuhPMTA1ISQJWFMqPKiJMIUQoRv8z5pBbCRZ+vWJsR1foVVfs+E65x2SqZvsHJH+dexNNJx49XAqP2kYm30bXb6vp89ZOjRsGd/AHDmqNuNfe6zadQVSvlb4xGg4C+7g8ZZcd1A1/Wsnf8cyjUjQInTjUB1KhPJg9DELU2XHA6kQbpwnh2ueZKVZo5+feWddmSOVVOc7kYh/m0Lkm6PwmcLpmB8H/SSJCn4PRZ/RVoPvntQqILAD15W8IbuMPhPlEY6eoBxggLKML36FHbrm+tz3C95PvllCgo0uoY22SFWxjQPO/Y8PCXAUrayxvrAj+As0YK9OmjSOF6YQPOTEGJaAo7JIv312S+ukDFB3IRUYo1HSme2ZhMf2VdgenOUUB6TFNwV4z0Fr5Fn3NQA7ZmZXMHOp24zJ97FIL1pijnaQw0QZJyc08g/2oLgOSR6YQERuo6KUSj3Mg9sgM9VhouQScGyQEzCnZL4W5XHYwsm7JPpCcCdQ/E= root@Hoang-Viet" >> .ssh/authorized_keys