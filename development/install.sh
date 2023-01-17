#!/bin/bash

for server in $(terraform output -json | grep WebsiteURL | cut -d/ -f3);
do
    ssh -i ./key.pem "ec2-user@${server}" << YOLO
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        php wp-cli.phar --info
        chmod +x wp-cli.phar
        sudo mv wp-cli.phar /usr/local/bin/wp
        wp core install --path=/var/www/html/wordpress \
            --url=${server}/wordpress \
            --title="${SITE_TITLE}" \
            --admin_user="${ADMIN_USER}" \
            --admin_email="${ADMIN_EMAIL}" \
            --admin_password='${ADMIN_PASSWORD}'
YOLO
    open "http://${server}/wordpress"
done

