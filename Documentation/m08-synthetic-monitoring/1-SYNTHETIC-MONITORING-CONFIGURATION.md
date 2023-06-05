# Synthetic Monitoring Configuration

In this demo, we're configuring synthetic monitoring for one of the Globomantics demo servers.

## Prerequisites
Be sure that you have already:
1. Set up a demo server
1. Installed the Datadog agent.
1. Configured the agent to report APM data for php-fpm and Apache httpd.

## Create a Synthetic Monitoring Test
1. In the Datadog web console, select `UX Monitoring` -> `Synthetic Tests` or browse to [https://us5.datadoghq.com/synthetics/tests](https://us5.datadoghq.com/synthetics/tests)

        Note that you may have to adjust the link above to reflect your region if your account is not located in the "us5" region.

1. Select `Create a New API Test`.
1. Under `Choose request type`, make sure HTTP is selected.
1. Under `Define request`, select `GET` and enter the URL for your server.

    Make sure to use `http://` if your endpoint does not have an SSL certificate.

1. Note the `Name` that is created according the to entry from the previous step.
1. Under `Environment`, select `Create New Env Tag`.  Enter the environment that correseponds to the server you selected for the URL.  For example, it could be `development`, `production`, or something appropriate for your account.
1. Select `Test URL`.  This test confirms all the settings are valid.
1. Note the `Request Preview` and `Response Preview` to the right of the form.
1. Note that after selecting `Test URL`, values are populated under `Define assertions` for:

    - `response time`
    - `status code`
    - `header`

    These values provide a baseline for future requests and can be kept as defaults or modified.

1. Select `New Assertion`.
1. Select `assertion type` and select `body` -> `contains`.  For `Body content` enter `Globomantics`.  Note that the status is already set to `PASSED` because the reponse preview contains the text.

        Note that you may need to use different text to allow the `body -> contains` assertion to pass.  Use a value that works for your configuration.

1. Under `Select Locations`, uncheck `All Locations`.
1. Select a few locations that are relatively close to the regions where your demo server is deployed.  Specifically, if you are in the Americas, choose 2-4 locaiton from that list.  The same for Asia Pacific and EMEA if your servers are based in those regions.

        Note that selecting locations that are geographically far from your server's region may cause long reuqest times which may cause the `response time` assertion to fail.

1. Under `Define retry conditions`, replace `0` with `1`.
1. under `Define scheduling and alert conditions`, select `5m`.
1. Leave all remaining settings as their defaults.
1. Select `Create`.

## Observe Synthetic Monitoring Test Results
1. After the test is created, wait for a minute or two or select `Run Test Now`.
1. Under `History`, select `Show All Locations`.  Note the status for each locations that was configured to send a request.
1. Under the chart labeled, `Response Time by Location`, Zoom in on the most recent tests.  Note the timing for each locations.
1. Under `Test Runs`, note the filters to view all tests, test that have passed, and tests that have failed.
1. Select the most recent test.  This opens a side panel with details for the selected test.
1. Under `Test Details`, note the following values:

    - Total response time (The total time it took to process the request)
    - DNS (The time spent resolving the demo server's DNS name)
    - Connection (The time to establish a TCP connection to the demo server.)
    - Time to first byte (The time spent waiting for the first byte of response to be received from the demo server)
    - Download (The time spent downloading the response from the demo server)

1. Under `Assertions`, note the actual values from the response compared to the values in the assertions.
1. At the top of the side panel, select `Trace`.  Observe the values of the Flame Graph including the trace and spans.
1. Press the `ESC` key to close the side panel.