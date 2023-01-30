#!/bin/bash
# start all instances in all regions
for i in us-{east,west}-{1,2};
do
    for server in $(aws ec2 describe-instances --region=${i} --query 'Reservations[].Instances[][].InstanceId' --filters Name=instance-state-name,Values=running --output=text);
    do
        aws ec2 start-instances --region=${i} --instance-ids ${servers} --output=json || echo "ok";
    done
done
