# APM Setup and Configuration

In this demo, we're configuring our Globamantics server to report APM metrics to datadog.

## Starting in the console
1. In the Datadog console, select `APM` -> `Setup & Configuration`.
1. Select `Instrument a new Service`.
1. Select `Host-Based`.
1. Under "Choose your language", select `php`.
1. Make a note of the installation instructions but don’t click links to download.  Clicking the links will download the installer to your local system, not the server.  You will run a command on the server to download the installer in just a moment.
1. Scroll down to step `4: Instrument your application`.
1. Next to **DD_SERVICE**, enter a name for your service.  Perhaps, `globomantics`.
1. Next to **DD_ENV**, enter a name for the environment.  Perhaps, `production`.
1. Next to **DD_VERSION** entera a version number.  Perhaps, `1.0.0`.
1. Leave all other settings as they are.
1. Under `4: Instrument your application`, note how the configuration snippets for php-fpmn, Apache, and PHP have been udpated with the values you entered for **DD_SERVICE**, **DD_ENV**, and **DD_VERSION**.
1. Keep the browser open and connect to your server.

## Continuing on the server
1. On the server, elevate your session to become the root user:

        sudo su -

1. Download the latest release of the ddtrace PHP installer:

        curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php

1. Run the installation script:

        php datadog-setup.php --php-bin=all

1. Edit the PHP-FPM configuration to add the values for **DD_SERVICE**, **DD_ENV**, and **DD_VERSION**:

        vim /etc/php-fpm.d/www.conf

1. Go back to the browser and copy the values **DD_SERVICE**, **DD_ENV**, and **DD_VERSION** for php-fpm.
1. Back on the server, paste the values at the end of the configuration file.

        env[DD_SERVICE] = 'globomantics'
        env[DD_ENV] = 'production'
        env[DD_VERSION] = '1.0.0'

1. Save the file and exit the editor.
1. Edit the Apache `status.conf` file to the values for **DD_SERVICE**, **DD_ENV**, and **DD_VERSION**:

        vim /etc/httpd/conf.modules.d/status.conf

1. Go back to the browser and copy the values **DD_SERVICE**, **DD_ENV**, and **DD_VERSION** for Apache.
1. Back on the server, paste the values at the end of the configuration file.

        SetEnv DD_SERVICE 'globomantics'
        SetEnv DD_ENV 'production'
        SetEnv DD_VERSION '1.0.0'

1. Save the file and exit the editor.
1. Restart php-fpm and Apache:

        systemctl restart php-fpm
        systemctl restart httpd

1. Check the status for php-fpm and Apache:

        systemctl status php-fpm
        systemctl status httpd

1. Send some traffic to the website using the following `wget` command.  This command will continuously "spider" the website by scanning every path on the site starting with the root path, `/wordpress/`.

        while :; do wget --spider --recursive --no-parent --level=3 --wait=1 http://localhost/wordpress/; done

1. Allow the command to run while you complete the next demo.
1. To stop the command when your're done, type `CTRL+C`.