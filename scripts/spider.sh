#!/bin/bash

# Read the list of servers from the file
SERVERS=$(cat /tmp/servers.txt)

while :;
do
    for i in ${SERVERS};
    do
        echo "Checking server: ${i}"
        wget -q --spider --recursive --no-parent --level=3 --wait=1 ${i}/wordpress/ &
    done
    wait
    sleep 3
done

rm -rvf ./ec2-* &> /dev/null

echo "Done"
