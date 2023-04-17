# Create a CPU Spike Using Stress
[Stress](https://linux.die.net/man/1/stress) is a command line application we can use to cause CPU spikes that can be analyzed in Datadog.

Specificaly, the CPU spikes are reported into the metric `system.cpu.user`.

The target system should already have the Datadog agent installed and should already be reporting into your Datadog account.

Follow these steps to install the `stress` command line interface on the target system and generate a CPU spike.

*Note that these instructions assume you are using Amazon Linux 2 as described in Module 4 of this course.*

1. Connect to The target system using SSH.
1. Elevate your session to become the root user.

        sudo su -

1. Install [Amazon Linux 2 Extras](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-ami-basics.html#extras-library).

        amazon-linux-extras install epel -y


1. Install the stress application.

        yum install stress -y

1. Use the stress command to create a CPU spike.

    The following invocation of `stress` will consume at most 2 CPU cores for 6 minutes:

        stress --cpu 2 --timeout 360


1. Go to the Datadog console and open the Metrics Explorer.
1. Use queries and filters as described in the lesson to view the CPU spike.

For more information on `stress` refer to the following link or run the command `man stress`.

- [stress - tool to impose load on and stress test systems](https://linux.die.net/man/1/stress)