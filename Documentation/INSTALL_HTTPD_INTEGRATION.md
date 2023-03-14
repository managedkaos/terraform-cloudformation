# Install HTTPD Integration

1. In the Datadog console, install the integration
1. Click the tile, click configure, click install
1. On each host, create a `status.conf` file

        vim /etc/httpd/conf.modules.d/status.conf

1. Add the config

        <Location "/server-status">
            SetHandler server-status
            Require host localhost
        </Location>

1. Restart the server

        systemctl restart httpd

1. Curl the status endpoint to check

        curl localhost/server-status?auto

1. Create a configuration file for apache using the example included with the agent

        cp /etc/datadog-agent/conf.d/apache.d/conf.yaml.example /etc/datadog-agent/conf.d/apache.d/conf.yaml


1. Restart the datadog-agent service

        systemctl restart datadog-agent

1. Check the status by running `datadog-agent configcheck` and using `grep` to find `apache check` in the output.

        datadog-agent configcheck | grep -A 5 "apache check"

    The output should be similar to the following:

        === apache check ===
        Configuration provider: file
        Configuration source: file:/etc/datadog-agent/conf.d/apache.d/conf.yaml
        Instance ID: apache:9ad92079e09f96b4
        apache_status_url: http://localhost/server-status?auto
        disable_generic_tags: true



# References
- [The Apache Integration](https://docs.datadoghq.com/integrations/apache/?tab=host)
- [Monitoring Apache web server performance
](https://www.datadoghq.com/blog/monitoring-apache-web-server-performance/)
- go to [check summary](https://us5.datadoghq.com/check/summary) to verify checks.