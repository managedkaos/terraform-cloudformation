# Create a Custom Dashboard

In this demo, we're tasked with creating a dashboard that reports the rate of requests being served by the Globomantics web servers.

## Requirements
Our dashboards should fulfill the following requirements by displaying:

1. The rate of requests being served by Globantics websites all around the world.
1. The number of web servers online.
1. An indication of hosts serving the most traffic.
1. The number of requests being served in each region.

Note that the number of hosts and the number of regions will depend on the resources you've deployed and configured with Datadog agents.  In the course demonstration, there are four web servers deployed with one server in the following regions: `us-east-1`, `us-east-2`, `us-west-1`, `us-west-2`.

## Solution
Follow these steps to create a custom dashboard with these requirements.

### Requirement 1: Total Request Rate
1. Log into your Datadog account.
1. Select `Dashboards` -> `New Dashboard`.
1. Enter a name for the dashboard.
1. Select `New Dasboard`.
1. From the sidebar, select `Timeseries` and drag the widget into place.
1. In the **Metrics** field, enter `apache.net.request_per_s`.
1. Select `avg by` and change it to `sum by`.
1. Select `Query Value`.
1. Select `Time Series Background` and select `Bars`.
1. Enter a title for the graph, perhaps "Total Request Rate"
1. Select `Save`.
1. Select the star next to the dashboard name to save it as a favorite.

### Requirement 2: Number of Web Servers Online
1. Select `Dashboards` -> `All Integrations` -> `Apache - Overview`.
1. At the top of the widget labeled `Server can connect`, select the export icon and then select `Copy`.
1. Go back to the dashboard you created for Requirement 1.
1. Paste the widget in by typing `CMD+V` on macOS or `CTRL+V` on Windows or Linux.
1. Edit the widget and change the name to "Servers Online".

### Requirement 3: Hosts Serving the Most Traffic
1. With the dashboard you created open, Select `Add Widgets`.
1. In the sidebar, search for `host map`.
1. From the sidebar, select `Host Map` and drag the widget into place.
1. Next to "Fill by:" enter `apache.net.request_per_s`.
1. Select `avg` and change it to `max`.
1. Title the graph "Host Map by Requests".
1. Add an annotation to give context to the host map.
1. Select `Add Widgets` -> `Notes & Links` -> Enter text -> `Annotation` -> `Show Pointer` -> Select pointer position as needed -> `Save`.

### Requirement 4: Number of Requests Served by Region
1. From the Datadog sidebar, select `Metrics Explorer`.
1. In the "Metrics" query field, enter `apache.net.request_per_s`.
1. Select `avg by` and change it to `sum by`.
1. Select `+ Add Query` as many times as needed so you have enough queries for the regions you are adding to the dashboard.
1. Modify each query by updating the `from` field, so that each query has one region for the regions you are adding to the dashboard.
1. Select `Save to Dashboard`.
1. Select the dashboard you created and then select `Export`.
1. Select `View dashboard` or navigate back to the dashboard you created.
1. Edit each of the regional graphs to: add a name, change the format from Timeseries to Query, change the backgound to bard.

