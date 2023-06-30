# Manage Downtime Notifications
Downtime refers to the period when a monitored system or service is unavailable or not functioning as expected.

Unplanned downtime can be caused by alert conditions outside of our control hardware failures, software problems, or issues with networks.

In these cases, we can expect Datadog monitors to send notifications informing us of the issue so we can work on getting systems back online and operating as expected.

However, we can also encounter downtime for planned activities like maintenance, deployments, or configuration changes.

In these cases, we might not want to send notifications.  Sending a notification when a system is taken offline on purpose or is expected to be offline can cause false alarms.

## References
- [Downtimes](https://docs.datadoghq.com/monitors/downtimes/)
- [Auto-muting](https://docs.datadoghq.com/monitors/downtimes/#auto-muting)

## Prerequisites
Be sure that you have already:
1. Set up a demo server
1. Installed the Datadog agent.
1. Configured the agent to report APM data for php-fpm and Apache httpd.
1. Created host and process monitors as described in the previous demonstration.

## Create an Auto-Muted Downtime Notification
1. Connect to a demo server running the Datadog agent.
1. Elevate your session to become the root user.

        sudo su -

1. Stop the server.

        shutdown -t now

1. Go to the Datadog console and wait for the alert condition on the "Host Monitor" to be triggered.
1. Select "Host Monitor".
1. Note the locations were auto-muting is called out.
1. Review the visual representation under the "Status & History" section.

## Create a Downtime Notification
1. In the Datadog console, select "Monitors" -> "Manage Downtimes".
1. Select "Schedule Downtime".
1. Under "Monitor:", select "Host Monitor".
1. Under "Group scope:", select "All".
1. Optionally, select "Preview Affected Monitors" to see the monitors that will be silenced by this downtime notification.
1. Under "Schedule", select "Recurring".
1. Create a weekly schedule by selecting

    - Start date
    - Time zone
    - Start time
    - Duration
    - Repeating every week
    - No end date

1. Review the preview to get an idea of when the schedule will be applied.
1. Optinoally, add a message and notification for your team.
1. Select "Save".
1. Close the panel for the notificaiton you just created.

## Review Downtime Notifications
1. On the "Manage Downtimes" tab, select both "True" and "False" under:

    - Active
    - Automuted
    - Recurring

1. Select and review each downtime notificaiton.
