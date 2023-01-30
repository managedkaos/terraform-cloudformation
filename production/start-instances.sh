#!/bin/bash
# start all instances in all regions
for i in us-{east,west}-{1,2};
do
    aws ec2 start-instances --region=${i} --instance-ids $(aws ec2 describe-instances --region=${i} --query 'Reservations[].Instances[][].InstanceId' --filters Name=instance-state-name,Values=stopped --output=text) --output=json || echo "ok";
done

# stop instances

