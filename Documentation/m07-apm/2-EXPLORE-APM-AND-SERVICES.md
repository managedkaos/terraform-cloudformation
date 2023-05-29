# APM Setup and Configuration

In this demo, we're exploring the Globomantics services that are reporting APM metrics to datadog.

## Prerequisites
Be sure that you have already:
1. Set up a demo server or servers.
1. Installed the Datadog agent.
1. Configured the agent to report data for php-fpm and Apache httpd.
1. Instrumented php and Apache httpd to report APM metrics to Datadog.
1. Started sending traffic to the server or servers.

## Starting in the web console
1. Select `APM` -> `Service Catalog`.
1. If it isn't already selected, select the tab named **Performance**.
1. Next to "Show data from:", select the `env:production`.
1. Note the services listed including `globomantics` (or the name you used for the main service), `mysqli`, and `curl`.
1. Hover your mouse over the listing for `globomantics`.
1. Select `Full Page`.
1. Review the service summary, noting the graphs for:

    - Requests and Errors
    - Latency

1. Scroll down and note the graphs for

    - Top 5 Requests
    - p99 Latency
    - Top 5 Errors
    - Resources

1. Next to each resource, note the values for

    - Number of requests
    - Total time
    - p50 Latency
    - p99 Latency
    - Errors
    - Error rate

1. Hover mouse over the top resource.  Note the link to view the full page for the resource where additional information can be viewed.
1. At the top of the screen, select `Traces`.
1. Note the list of traces.
1. Select the trace at the top of the list.
1. Note the flame graph that gets displayed for the trace.
1. Within the flame graph, note the spans that indicate work done by the globomantics service and the mysql database.
1. Hover your mouse over a span and note the updated information at the bottom of the page.
1. Select the top-level span.
1. Select `infrastructure`.
1. Note the metrics displayed for the web server that fulfilled the request. Specifically, note the marker that indicates when the trace took place in relation to the server's metrics.