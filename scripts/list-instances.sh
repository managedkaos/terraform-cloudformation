#!/bin/bash
# start all instances in all regions
for dns in PublicDnsName PrivateDnsName;
do
    for region in us-{east,west}-{1,2};
    do
        aws ec2 describe-instances --region="${region}" \
            --query "Reservations[].Instances[][].${dns}" \
            --output=text
    done > "${dns}-${ENVIRONMENT}.txt"
done
