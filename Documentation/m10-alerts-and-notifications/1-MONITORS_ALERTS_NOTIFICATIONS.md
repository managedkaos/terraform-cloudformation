# Monitors, Alerts, and Notifications

Datadog allows us to create monitors that check metrics and application performance among other data.  Monitors can specify alert conditions used to determine alerts, warnings, or recoveries.  In any of these cases, monitors can send notifications to keep us informed.

## References
- [Monitors](https://docs.datadoghq.com/monitors/)
- [Types of Monitors](https://docs.datadoghq.com/monitors/types/)
- [Configure Monitors](https://docs.datadoghq.com/monitors/configuration/)
- [Notifications](https://docs.datadoghq.com/monitors/notify/)
- [Notification Variables](https://docs.datadoghq.com/monitors/notify/variables/)

## Monitor Types
|Monitor Type|Description|
|------------|-----------|
|Host |  Check if one or more hosts are reporting to Datadog.|
|Metric |  Compare values of a metric with a user-defined threshold.|
|Anomaly |  Detect anomalous behavior for a metric based on historical data.|
|APM |  Monitor APM metrics or trace queries.|
|Audit Trail |  Alert when a specified type of audit log exceeds a user-defined threshold over a given period of time.|
|CI |  Monitor CI pipelines and tests data gathered by Datadog.|
|Cloud Cost |  Monitor cost changes associated with cloud platforms.|
|Composite |  Alert on an expression combining multiple monitors.|
|Database Monitoring |  Monitor query execution and explain plan data gathered by Datadog.|
|Error Tracking |  Monitor issues in your applications gathered by Datadog.|
|Event |  Monitor events gathered by Datadog.|
|Forecast |  Alert when a metric is projected to cross a threshold.|
|Integration |  Monitor metric values or health status from a specific integration.|
|Live Process |  Check if one or more processes are running on a host.|
|Logs |  Alert when a specified type of log exceeds a user-defined threshold over a given period of time.|
|Network |  Check the status of TCP/HTTP endpoints.|
|Outlier |  Alert on members of a group behaving differently than the others.|
|Process Check |  Watch the status produced by the process.up service check.|
|Real User Monitoring |  Monitor real user data gathered by Datadog.|
|Service Check |  Monitor the status of arbitrary custom checks.|
|SLO Alerts |  Monitor your SLO's error budget and burn rate.|
|Synthetic Monitoring |  Monitor metric values or test status from Synthetic test runs.|
|Watchdog |  Get notified when Watchdog detects anomalous behavior.|
