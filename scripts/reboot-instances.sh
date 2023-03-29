#!/bin/bash
# reboot all instances in all regions
for region in us-{east,west}-{1,2};
do
    echo "${region}";
    for server in $(aws ec2 describe-instances --region="${region}" --query 'Reservations[].Instances[][].InstanceId' --output=text);
    do
        aws ec2 reboot-instances --instance-ids --region="${region}" --instance-ids "${server}" --output=json || echo "ok";
    done
done
