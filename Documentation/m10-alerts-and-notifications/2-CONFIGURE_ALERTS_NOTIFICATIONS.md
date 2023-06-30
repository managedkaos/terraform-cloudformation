# Configure Alerts and Notifications
Use this demo to create four monitors:
- Host monitor to check all of the demo servers running the globomantics web applications.
- Process monitor to make sure apache is running on all of the servers.
- Two application performance monitors to track the error rate for the production and development environments of the Globomantics web application.

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

## Create the Host Monitor
1. In the Datadog web console, select "Monitor" -> "New Monitor".
1. Select the "Host" monitor type.
1. For the host selection, choose "All monitored hosts".
1. Confirm "Check Alert" is selected.
1. For the notification subject, enter "Host Monitor".
1. For the notification message body, enter the following (or copy from the included exercise file, `host-monitor-message-body.txt`):

        - Name : {{host.name}}
        - Availability Zone :  {{host.availability-zone}}
        - AWS Account :  {{host.aws_account}}
        - Cloudformation Logical ID :  {{host.aws_cloudformation_logical-id}}
        - Cloudformation Stack ID :  {{host.aws_cloudformation_stack-id}}
        - Cloudformation Stack Name :  {{host.aws_cloudformation_stack-name}}
        - Image :  {{host.image}}
        - Instance Type :  {{host.instance-type}}
        - Name Tag :  {{host.name_tag}}
        - Region :  {{host.region}}
        - Security Group :  {{host.security-group}}

1. Select a notification recipient.
1. Optionally, next to "Content displayed in notification", select "Hide handles".
1. Select "Create".

## Create the Process Monitor
1. In the Datadog web console, select "Monitor" -> "New Monitor".
1. Select the "Live Process" monitor type.
1. In the "Search for" field, enter "httpd".
1. Select "Simple Alert" and then select "Multi Alert".
1. For the "(select group)" option, select "host".
1. Next to "Trigger when the evaluated value is", select "below".
1. For the alert threshold, enter `1`.  For the warning threshold, enter `4`.
1. For the monitor name/subject, enter:

            Apache Process Monitor

1. For the notification message body, enter the following (or copy from the included exercise file, `process-monitor-message-body.txt`):

            {{#is_alert}}
            Apache process count {{value}} is below {{threshold}}!
            {{/is_alert}}

            {{#is_recovery}}
            Apache process count is now {{value}}.
            {{/is_recovery}}

1. If needed, scroll up and view the chart at the top of the form.  Note how the chart is updated to include the warning and alert ranges along with the current count of the httpd process.
1. Select a notification recipient.
1. Optionally, next to "Content displayed in notification", select "Hide handles".
1. Select "Create".

## Create the Application Performance Monitor for the Development Environment
1. In the Datadog web console, select "Monitor" -> "New Monitor".
1. Select the "Live Process" monitor type.
1. Next to "Service:", select the name of the service representing your demo web application, ie "globomantics".
1. Under "Set alert conditions", necet to "Trigger when", select `Errors rate`.
1. For the alert threshold, enter `10` and for the warning threshold, enter `5`.
1. Under "Notify your team", note how the subject/name, message body, and recipient have already been filled in.
1. Optionally, for development environments, remove the recipient to reduce notifications from a non-production environment.
1. Select "Create".
1. Optionally, after the monitor is created, select the cog in the upper right and select "Clone".  Update the cloned monitor by replacing all occurrences of `env:development` with `env:production`, including in the subject/name of the monitor and the monitor tags.  Save the cloned monitor when all updates are in place.


