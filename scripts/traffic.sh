#!/bin/bash

true > /tmp/serverlist.txt

for i in us-{east,west}-{1,2};
do
    for server in $(aws ec2 describe-instances --region="${i}" --query 'Reservations[].Instances[][].PublicDnsName' --filters Name=instance-state-name,Values=running --output=text);
    do
        echo "${server}" >> /tmp/serverlist.txt
    done
done

while :;
do
    while read -r server;
    do
        curl -sLk --max-time 30 --output /dev/null --write-out "%{time_total} %{http_code} %{url_effective}\n" "http://${server}/wordpress"
        curl -sLk --max-time 30 --output /dev/null --write-out "%{time_total} %{http_code} %{url_effective}\n" "http://${server}/wordpress/index.php/sample-page/"
    done < /tmp/serverlist.txt
done
