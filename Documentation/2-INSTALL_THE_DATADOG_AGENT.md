# Install the Datadog Agent
Follow these steps to install the [Datadog Agent](https://docs.datadoghq.com/agent/).

> The Datadog Agent is software that runs on your hosts. It collects events and metrics from hosts and sends them to Datadog, where you can analyze your monitoring and performance data. The Datadog Agent is open source and its source code is available on GitHub at DataDog/datadog-agent.


1. In the Datadog web console, select `Integrations -> Agents`.

1. Review the available agents.  There are:
    - Modern operating systmems like MacOS and Windows
    - Several versions of Linux
    - And many common devleopment tools like Docker and Kubernetes

1. Select `Amazon Linux`.

1. Select `Select API Key`.

1. Create a new key for the agent.  This will allow you to rotate the Agent key without affecting the key used for the AWS account integration.

1. Select `+Create New`; Name the key `Datadog Agent`.

1. Select `Use API Key`.

1. Under New installation, note that the `DD_API_KEY` environment variable has been filled in with the API key we selected.

1. Copy the prepopulated string for a one-step installation.

1. Highlight the installation string, `mouse right-click` -> `copy`.

1. Use SSH to connect to the EC2 instance where your demo environment is deployed.

1. Elevate the session to root with `sudo su -`.

1. With the mouse, `mouse right-click` -> `paste`.

1. The installation should begin and complete without error.

1. The datadog agent is installed as a service and can be controlled with the `systemctl` command.

1. Run `systemctl status datadog-agent`.

1. Clear the screen by typing `clear`.

1. There is also a `datadog-agent` command line interface.

1. Clear the screen by typing `clear`.

1. Run `datadog-agent status | more`.

1. This gives more specific details on the status of the agent and the data being sent to datadog.

1. Now configure the agent.

1. `cd` to `/etc/datadog-agent` and run `ls`.

1. The agent uses `/etc/datadog-agent` directory to store configurations for the agent itself and any application specific integrations.

1. Edit `datadog.yaml` with `vim`.

1. The hostname can be set using the `hostname` configuration.

1. Search for `/hostname:/`.

1. Uncomment the line and replace `<HOSTNAME_NAME>` with `webserver-1`.

1. Now enable "process collection".

1. Search for `/process_config/`.

1. Three changes must be made to enable process collection.

    1. First, uncomment the line `# process_config:`.
    1. Then, uncomment the line `# process_collection:`.
    1. And last, uncomment the line `# enabled: false`.

1. Replace `# enabled: false` with `# enabled: true`.

1. Save the file and exit the editor by typing `ESC` then `:wq`.

1. The datadog agent service needs to be restarted to pick up the new configuration.

1. Run `systemctl restart datadog-agent`.

1. The updated configuration can be checked using `datadog-agent hostname`.  The output of this command should show the name assigned in the configuration, `webserver-1`.

1. Run `datadog-agent hostname` and observe the output.

1. Go back to the datadog console.

1. If you manually set the hostname in the Agent’s configuration, you might see duplicated names on the Datadog infrastructure list and map pages. The duplicate host names disappear after a few hours and do not affect your billing.
