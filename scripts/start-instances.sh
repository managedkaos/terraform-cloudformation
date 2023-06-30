#!/bin/bash
# start all running instances in all regions
for region in us-{east,west}-{1,2}; do
    echo "${region}";
    (
        instance_ids=$(aws ec2 describe-instances --region="${region}" --filters Name=instance-state-name,Values=stopped --query='Reservations[].Instances[].InstanceId' --output=text)
        aws ec2 start-instances --region="${region}" --instance-ids $instance_ids --output=json && \
        aws ec2 wait instance-running --region="${region}" --instance-ids $instance_ids || echo OK
    ) &
done

# wait for all subprocesses to complete successfully
wait
echo "All instances running"
say "All instances running" || echo "All instances running"
