#!/bin/bash
# start all instances in all regions
for region in us-{east,west}-{1,2};
do
    echo -n "${region}      ";
    aws ec2 describe-instances --region="${region}" \
        --query 'Reservations[].Instances[][].PublicDnsName' \
        --output=text
done
