#!/bin/bash

# Read the list of servers from the file
SERVERS=$(cat /tmp/serverlist.txt)

# Define the parameters for the Apache Bench command
AB_PARAMS="-n 1 -c 5 -t 60"

# Initialize the iteration counter
ITERATION=0

# Loop indefinitely
while :; do
  # Increment the iteration counter
  ITERATION=$((ITERATION+1))

  # Loop through each server and fork a process to send traffic to it using Apache Bench
  for server in $SERVERS; do
    echo "$(date) Iteration $ITERATION: Sending traffic to $server in background..."
    /usr/bin/ab $AB_PARAMS "http://$server/" > /dev/null 2>&1 &
  done

  # Wait for all background processes to finish
  echo "$(date) Waiting for all traffic to finish in iteration $ITERATION..."
  wait

  # Output a message indicating that the iteration has finished
  echo "$(date) Iteration $ITERATION finished."

  # Sleep for 5 seconds before starting the next iteration
  sleep 5
done
