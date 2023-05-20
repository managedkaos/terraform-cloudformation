#!/bin/bash

# Read the list of servers from all files passed in on the command line
SERVERS=$(cat ${@})

# Initialize the iteration counter
ITERATION=0

# Loop indefinitely
while :; do
  # Increment the iteration counter
  ITERATION=$((ITERATION+1))

  # Loop through each server and fork a process to send traffic to it using Apache Bench
  for server in $SERVERS; do
    echo "$(date) Spider Iteration $ITERATION: $server"
        wget -q --spider --recursive --no-parent --level=3 --wait=1 "http://${server}/wordpress/" &
  done

  # Wait for all background processes to finish
  echo "$(date) Waiting for spider to finish iteration $ITERATION..."
  wait
  rm -rvf ./ec2-* &> /dev/null

  # Output a message indicating that the iteration has finished
  echo "$(date) Spider Iteration $ITERATION finished."

  # Sleep before starting the next iteration
done
