# Install the Datadog Agent

1. Start with an SSH session to one of the EC2 instances.

1. On the datadog console, select `Integrations -> Agents`.

1. Review the available agents:
    - Modern operating systmems like MacOS and Windows
    - Several versions of Linux
    - And many common devleopment tools like Docker and Kubernetes

1. Click `Amazon Linux`.

1. Explain that we need  to use an API key for the installation.

1. Click `Select API Key`.

1. Explain that we will create a new key for the agents.  This will allow us to rotate the Agent key without affect the key we used for the AWS account integration.

1. Click `+Create New`; Name the key `Datadog Agent`.

1. Click `Use API Key`.

1. Under New installation, note that the `DD_API_KEY` environment variable has been filled in with the API key we selected.

1. All we need to do is copy the prepopulated string for a one-step installation.

1. With the mouse, highlight the string, `mouse right-click` -> `copy`.

1. Go to the window with the SSH session.

1. Elevate the session to root with `sudo su -`.

1. With the mouse, `mouse right-click` -> `paste`.

1. The installation should begin and then complete without error.

1. Explain that the datadog agent is installed as a service and can be controlled with the `systemctl` command.

1. Run `systemctl status datadog-agent`.

1. Clear the screen by typing `clear`.

1. Explain that there is also a datadog-agent command line interface.

1. Clear the screen by typing `clear`.

1. Run `datadog-agent status | more`.

1. Explain how this gives more specific details on the status of the agent and the data being sent to datadog.

1. Now let's configure the agent.

1. `cd` to `/etc/datadog-agent` and run `ls`.

1. Explain that this is the directory that the agent uses to store configurations for the agent itself and any application specific integrations.

1. Edit `datadog.yaml` with `vim`.

1. Explain that the hostname can be set using the hostname configuration.

1. Search for `/hostname:/`.

1. Uncomment the line and replace `<HOSTNAME_NAME>` with `webserver-1`.

1. Explain that now the process collection needs to be enabled.

1. Search for `/process_config/`.

1. Explain that we need to make three changes to enable process collection.

    1. First, uncomment the line `# process_config:`.
    1. Then, uncomment the line `# process_collection:`.
    1. And last, uncomment the line `# enabled: false`.

1. Replace `false` with `true`.

1. Save the file and exit the editor.

1. Explain that the datadog agent service needs to be restarted to pick up the new configuration.

1. Run `systemctl restart datadog-agent`.

1. Explain that the updated configuration can be checked using `datadog-agent hostname`.  The output of this command should show the name assigned in the configuration, `webserver-1`.

1. Run `datadog-agent hostname` and observe the output.

1. See the complete configuration without comments using the command: `grep -vE "^$|#" datadog.yaml`:w

1. Go back to the datadog console.

1. Duplicated hosts when installing the Agent...
    If you manually set the hostname in the Agent’s configuration, you might see duplicated names on the Datadog infrastructure list and map pages for a few hours. The duplicate hosts disappear a few hours later, and does not affect your billing.

