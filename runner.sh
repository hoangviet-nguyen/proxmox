#!/bin/bash

SERVERS=(debian@86.119.46.91 debian@86.119.47.174 debian@86.119.46.187)

for  server in "${SERVERS[@]}"
do
    echo "Connecting to server $server"
    ssh $server <<EOF
    echo "Checking and removing scripts directory if it exists"
    if [ -d "scripts" ]; then
        sudo rm -r "scripts"
    fi
    echo "Creating scripts directory"
    mkdir "scripts"
EOF
    
    echo "Transferring scripts to server $server"
    scp "./scripts/user/credentials.sh" $server:~/scripts
    scp "./scripts/user/delete.sh" $server:~/scripts
    scp "./scripts/network.sh" $server:~/scripts

    ssh $server << EOF
    echo "Changing rights for the scripts"
    cd scripts
    sudo chmod u+x credentials.sh delete.sh network.sh
    echo "Running the credential scripts"
    sudo ./delete.sh
    sudo ./credentials.sh
    echo "Running Network script"
    sudo ./network.sh
EOF
done