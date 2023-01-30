#!/bin/bash

for i in us-{east,west}-{1,2};
do
    for server in $(aws ec2 describe-instances --region=${i} --query 'Reservations[].Instances[][].PublicDnsName' --filters Name=instance-state-name,Values=running --output=text);
    do
        echo "ssh -i ./key.pem ec2-user@${server}"
        ssh -i ./key.pem "ec2-user@${server}" << YOLO
        curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        sudo mv wp-cli.phar /usr/local/bin/wp
        sudo /usr/local/bin/wp core install --path=/var/www/html/wordpress \
            --url=${server}/wordpress \
            --title="${SITE_TITLE}" \
            --admin_user="${ADMIN_USER}" \
            --admin_email="${ADMIN_EMAIL}" \
            --admin_password='${ADMIN_PASSWORD}'
YOLO
        open "http://${server}/wordpress"
    done
done
