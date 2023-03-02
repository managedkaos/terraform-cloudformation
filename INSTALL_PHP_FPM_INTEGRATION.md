# Install PHP-FPM Integration

1. In the Datadog console, install the integration
1. Click the tile, click configure, click install
1. On each host, edit `/etc/php-fpm.d/www.conf`

        vim /etc/php-fpm.d/www.conf

1. Search for the lines containing `pm.status_path`.  Uncomment the line by removing the `;` character at the start of the line:

        pm.status_path = /status


1. Update the apache status config to include a line for the PHP-FPM status.

        vim /etc/httpd/conf.modules.d/status.conf

1.  Add the following lines:

        <LocationMatch "/status">
            ProxyPass "unix:/run/php-fpm/www.sock|fcgi://localhost/status"
            Require host localhost
        </LocationMatch>

1. Restart the `php-fpm` and `httpd` services.

        systemctl restart php-fpm
        systemctl restart httpd

1. Curl the status endpoint to check

        curl localhost/status

1. Create a configuration file for php using the example included with the agent

        cp /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml.example /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml

1. Edit the file

        vim /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml

    search for and uncomment the line for the status url:

        status_url: http://localhost/status

1. Restart the datadog-agent service

        systemctl restart datadog-agent

1. Check the status by running `datadog-agent configcheck` and using `grep` to find the `php_fpm` in the output.

        datadog-agent configcheck | grep -A 5 "php_fpm check"


    The output should be similar to the following:

        === php_fpm check ===
        Configuration provider: file
        Configuration source: file:/etc/datadog-agent/conf.d/php_fpm.d/conf.yaml
        Instance ID: php_fpm:4c320b4fb76c7ebb
        status_url: http://localhost/status
