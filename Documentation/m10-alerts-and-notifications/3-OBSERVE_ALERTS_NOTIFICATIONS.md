# Observe Alerts and Notifications
With monitors in place, create an alert condition and observe the alerts in the Datadog UI and notifications sent via email.

## References
- [Monitors](https://docs.datadoghq.com/monitors/)
- [Types of Monitors](https://docs.datadoghq.com/monitors/types/)
- [Configure Monitors](https://docs.datadoghq.com/monitors/configuration/)
- [Notifications](https://docs.datadoghq.com/monitors/notify/)
- [Notification Variables](https://docs.datadoghq.com/monitors/notify/variables/)

## Prerequisites
Be sure that you have already:
1. Set up a demo server
1. Installed the Datadog agent.
1. Configured the agent to report APM data for php-fpm and Apache httpd.
1. Created host and process monitors as described in the previous demonstration.

## Stop the Datadog Agent to Trigger an Alert Condition
1. Connect to a demo server running the Datadog agent.
1. Elevate your session to become the root user.

        sudo su -

1. Stop the Datadog agent.

        systemctl stop datadog-agent

1. Use the `status` command to confirm the agent is stopped.  Add the `-l` switch to see the complete output.

        systemctl status datadog-agent -l

1. Go to the Datadog console and select "Monitors" -> "Manage Monitors".
1. Wait for the monitors to register alert conditions.

## Observe Alerts and Notifications in Datadog
1. After the monitors are indicating an alert condition, select the "Triggered Monitors" tab.
1. Note how the view only displays monitors that have triggered alerts.
1. Select the "Host Monitor".
1. Review the details displayed including the alert message, the status history, and monitor events.

## Observe Alerts and Notifications in Email
1. In your email client, locate the email alerts sent by Datadog.
1. Note the details conveyed by the subject including the name of the monitor and the host experiencing the alert condition.
1. Inside the email, note the contents of the message body and how variables in the message template now show data relating to the alert.
1. Note the links from the email back to the Datadog console, particularly the direct links to view the event, the monitor, or the host.

## Restart the Datadog Agent to Resolve the Alert Condition
1. Connect to the demo server where you stopped the Datadog agent.
1. Elevate your session to become the root user.

        sudo su -

1. Start the Datadog agent.

        systemctl start datadog-agent

1. Use the `status` command to confirm the agent is running.

        systemctl status datadog-agent

1. Go to the Datadog console and select "Monitors" -> "Manage Monitors".
1. Wait for the monitors to recover from the alert conditions.
1. Review the history and events in the monitors and observe the reocovery notificaitons sent by Datadog.
