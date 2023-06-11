# Configure Log Collection
In this demo, we're configuring log collection for the Globomantics demo servers.


## References
- [Getting Started with Logs](https://docs.datadoghq.com/getting_started/logs/)
- [How to monitor Apache web server with Datadog: Logs](https://www.datadoghq.com/blog/monitor-apache-web-server-datadog/#enable-the-agent-to-collect-logs)


## Prerequisites
Be sure that you have already:
1. Set up a demo server
1. Installed the Datadog agent.
1. Configured the agent to report APM data for php-fpm and Apache httpd.


## Update the Datadog Agent Configuration
1. Connect to the demo server and elevate your session to become the root user.

        sudo su -

1. Check the current status of the Datadog agent

        datadog-agent status | grep -A 20 "Logs Agent"

    This command reports the status of the Datadog agent, pipes the output to grep, and reports the 20 lines that follow the line containing "Logs Agent".

    If log collection has not been enabled, the output should be simliar to the following:

        Logs Agent
        ==========

        Logs Agent is not running

1. Edit the configuration file for the Datadog agent.

        vim /etc/datadog-agent/datadog.yaml

1. Search for `logs_enabled:`.
1. Remove the `#` character at the beginning of the line.
1. On the same line, replace `false` with `true`.
1. Save the file.


## Update the Apache Integration


_**NOTE: These instructions are for Apache installed on a server running the Amazon Linux 2 operating system.  If you are not using Amazon Linux 2, confirm the names and locations for Apache log files on your system before proceeding.**_


1. Edit the configuration file for the Apache integration:

        vim /etc/datadog-agent/conf.d/apache.d/conf.yaml

1. Search for `logs:`.  The file should appear as follows:

        # logs:
        #   - type: file
        #     path: /var/log/apache2/access.log
        #     source: apache
        #     service: apache
        #   - type: file
        #     path: /var/log/apache2/error.log
        #     source: apache
        #     service: apache

1. Remove the `#` character at the beginning of the line and all of the lines that follow.
1. For each occurrence of `service:`, replace `apache` with `globomantics`.
1. For each occurrence of `path`, replace `apache2` with `httpd`.
1. Replace `access.log` with `access_log`.
1. Replace `error.log` with `error_log`.
1. Save the file.


## Set Permissions for /var/log/httpd


_**NOTE: These instructions are for Apache installed on a server running the Amazon Linux 2 operating system.  If you are not using Amazon Linux 2, confirm the permissions on the directory containing Apache log files on your system before proceeding.**_


_**NOTE: Changing permissions per the following directions allows ALL users that can connect to the system where Apache is running to view all Apache logs.**_


1. Check the permissions on the directory where Apache logs are written.

        ls -l /var/log | grep httpd

    The output should indicate that access to the `httpd` directory is limited to the root user:

        drwx------  2 root     root                94 ... httpd

1. Modify the permissions on the directory to allow the Datadog agent to read log files:

        chmod +rx /var/log/httpd

1. Check the permissions on the Apache logs directory again.

        ls -l /var/log | grep httpd

    The output should indicate that `read` and `execute` permissions have been given to all users:

        drwxr-xr-x  2 root     root                94 ... httpd


## Restart the Datadog agent and Check Status

1. Restart the datadog-agent.

        systemctl restart datadog-agent

1. Check the status of the datadog-agent.

        datadog-agent status | grep -A 20 "Logs Agent"

    Output should be simliar to the following:

        Logs Agent
        ==========
            Reliable: Sending compressed logs in HTTPS to agent-http-intake.logs.us5.datadoghq.com on port 443
            BytesSent: 11232
            EncodedBytesSent: 9590
            LogsProcessed: 36
            LogsSent: 36
            CoreAgentProcessOpenFiles: 26
            OSFileLimit: 4096

        apache
        ------
            - Type: file
            Path: /var/log/httpd/access_log
            Service: globomantics
            Source: apache
            Status: OK
            Inputs:
                /var/log/httpd/access_log
            Bytes Read: 4032
            Pipeline Latency:


## Confirm Log Collection in the Datadog Web Console
In the Datadog web console, open the `Logs` tab.

