# Configure Alerts and Notifications
Use this demo to create four monitors:
- Host monitor to check all of the demo servers running the globomantics web applications.
- Process monitor to make sure apache is running on all of the servers.
- Two application performance monitors to track the error rate for the production and development environments of the Globomantics web application.

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

...

1. For the notification subject, enter:

            Host Monitor

1. For the notification message body, enter:

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
Subject:

            Apache Process Monitor

Message:

            {{#is_alert}}
            Apache process count {{value}} is below {{threshold}}!
            {{/is_alert}}

            {{#is_recovery}}
            Apache process count is now {{value}}.
            {{/is_recovery}}

## Create the Application Performance Monitor for the Development Environment


## Create the Application Performance Monitor for the Production Environment


