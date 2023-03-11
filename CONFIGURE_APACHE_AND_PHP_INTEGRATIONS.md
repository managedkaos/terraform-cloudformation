# Install the Apache and PHP Integrations

1. In the Datadog console, install the Apache and PHP integrations.
1. Select `Integrations -> Integrations`.
1. Note the detected installations for `Apache` and `PHP`
1. Select the tile for `Apache`
1. Select `Install`.
1. Select the `Configure` tab and note the instructions to configure the application.
1. Repeat the integration installation steps for `PHP`.

# Configure Apache and PHP on the Server
The following steps walk you through configuring the Datadog agent, Apache, and PHP for application integrations.

Repeat the steps as needed for each server in your fleet.

1. Connect to the server via `SSH` and elevate your session to become the root user.

        sudo su -

1. Create a `status.conf` file in the Apache modules folder, `/etc/httpd/conf.modules.d/`.

        vim /etc/httpd/conf.modules.d/status.conf

1. Add the following configuration and save the file:

        <Location "/server-status">
            SetHandler server-status
            Require host localhost
        </Location>

        <LocationMatch "/status">
            ProxyPass "unix:/run/php-fpm/www.sock|fcgi://localhost/status"
            Require host localhost
        </LocationMatch>

1. Now edit the PHP configuration file, `/etc/php-fpm.d/www.conf`

        vim /etc/php-fpm.d/www.conf

1. Search for the lines containing `pm.status_path`.  Uncomment the line by removing the `;` character at the start of the line:

        pm.status_path = /status

1. Restart the `php-fpm` and `httpd` services.

        systemctl restart php-fpm
        systemctl restart httpd

1. Curl the `/server-status` and `/status` endpoints to check the configuration.

        curl localhost/server-status?auto
        curl localhost/status

1. Create a configuration file for Apache by copying the the example included with the agent and renaming it.

        cp /etc/datadog-agent/conf.d/apache.d/conf.yaml.example /etc/datadog-agent/conf.d/apache.d/conf.yaml

1. Create a configuration file for PHP by copying the the example included with the agent and renaming it.

        cp /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml.example /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml

1. Edit the Datadog agent configuration file for PHP.

        vim /etc/datadog-agent/conf.d/php_fpm.d/conf.yaml

1. search for and uncomment the line for the status url:

        status_url: http://localhost/status

1. Restart the datadog-agent service

        systemctl restart datadog-agent

1. Check the agent configuration status for Apache by running `datadog-agent configcheck` and using `grep` to find `apache check` in the output.

        datadog-agent configcheck | grep -A 4 "apache check"

    The output should be similar to the following:

        === apache check ===
        Configuration provider: file
        Configuration source: file:/etc/datadog-agent/conf.d/apache.d/conf.yaml
        Instance ID: apache:9ad92079e09f96b4
        apache_status_url: http://localhost/server-status?auto

1. Check the agent configuration status for PHP by running `datadog-agent configcheck` and using `grep` to find the `php_fpm check` in the output.

        datadog-agent configcheck | grep -A 4 "php_fpm check"

    The output should be similar to the following:

        === php_fpm check ===
        Configuration provider: file
        Configuration source: file:/etc/datadog-agent/conf.d/php_fpm.d/conf.yaml
        Instance ID: php_fpm:4c320b4fb76c7ebb
        status_url: http://localhost/status