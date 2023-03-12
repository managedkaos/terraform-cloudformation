#!/bin/bash
# list all instances in all regions
for dns in PublicDnsName;
do
    for region in us-{east,west}-{1,2};
    do
        aws ec2 describe-instances --region="${region}" \
            --filters "Name=tag-key,Values=aws:cloudformation:logical-id" \
            --filters "Name=tag:aws:cloudformation:logical-id,Values=WebServer" \
            --query "Reservations[].Instances[][].${dns}" \
            --output=text
    done | tee "${dns}-${ENVIRONMENT}.txt"
done
