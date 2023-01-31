#!/bin/bash

true > /tmp/serverlist.txt

for i in us-{east,west}-{1,2};
do
    for server in $(aws ec2 describe-instances --region=${i} --query 'Reservations[].Instances[][].PublicDnsName' --filters Name=instance-state-name,Values=running --output=text);
    do
        echo "${server}" >> /tmp/serverlist.txt
    done
done

while :;
do
    while read server;
    do
        wget --recursive --spider "http://${server}/wordpress"
    done < /tmp/serverlist.txt
done
