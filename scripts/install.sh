curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info
wp core install --path=/var/www/html/wordpress --url='http://ec2-3-239-230-226.compute-1.amazonaws.com/wordpress' --title='Globomantics Datadog Demo' --admin_user=admin --admin_password='T5|[8C$1Grs!`%^w(-^eVqs(DZ9q7Ffn' --admin_email='datadog-testing-1@managedkaos.com'
