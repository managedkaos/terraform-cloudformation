#!/bin/bash

# Read the list of servers from all files passed in on the command line
SERVERS=$(cat ${@})

# Initialize the iteration counter
ITERATION=0

# Loop indefinitely
while :; do
  # Increment the iteration counter
  ITERATION=$((ITERATION+1))

  # Loop through each server and fork a process to start the stress command
  for server in $SERVERS; do
    echo "$(date) Stress Iteration $ITERATION: $server"
    ssh "${server}" 'nohup /usr/bin/stress --cpu 1 --vm 1 --timeout 60 > stress.txt 2>&1 &'
  done

  # Wait for all background processes to finish
  echo "$(date) Waiting for Stress to finish iteration $ITERATION..."
  wait
  rm -rvf ./ec2-* &> /dev/null

  # Output a message indicating that the iteration has finished
  echo "$(date) Stress iteration $ITERATION finished."

  # Sleep before starting the next iteration
  sleep 60
done
