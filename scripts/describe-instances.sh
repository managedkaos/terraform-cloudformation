#!/bin/bash
# start all instances in all regions
for region in us-{east,west}-{1,2};
do
    echo "${region}";
    aws ec2 describe-instances --region=${region} --query='Reservations[].Instances[][].[InstanceId,State]'
done
