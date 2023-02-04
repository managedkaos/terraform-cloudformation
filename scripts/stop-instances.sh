#!/bin/bash
# stop all running instances in all regions
for region in us-{east,west}-{1,2};
do
    echo "${region}";
    aws ec2 stop-instances --region=${region} --instance-ids $(aws ec2 describe-instances --region=${region} --query 'Reservations[].Instances[][].InstanceId' --filters Name=instance-state-name,Values=running --output=text) --output=json || echo "ok";
done
