#!/bin/bash

# Read the list of servers from all files passed in on the command line
SERVERS=$(cat ${@})

# Define the parameters for the Apache Bench command
AB_PARAMS="-n 10 -c 5 -t 120"

# Initialize the iteration counter
ITERATION=0

# Loop indefinitely
while :; do
  # Increment the iteration counter
  ITERATION=$((ITERATION+1))

  # Use the modulo operator to check if ITERATION is even or odd
  if [ $((ITERATION % 2)) -eq 0 ]
  then
    ROUTE="wordpress/"
  else
    ROUTE="wordpress/index.php/sample-page/"
  fi

  # Loop through each server and fork a process to send traffic to it using Apache Bench
  for server in $SERVERS; do
    echo "$(date) Apache Bench Iteration $ITERATION: $server"
    /usr/bin/ab "${AB_PARAMS}" "http://$server/${ROUTE}" > /dev/null 2>&1 &
  done

  # Wait for all background processes to finish
  echo "$(date) Waiting for apache-bench to finish iteration $ITERATION..."
  wait

  # Output a message indicating that the iteration has finished
  echo "$(date) Apache Bench Iteration $ITERATION finished."

  # Sleep before starting the next iteration
  sleep 120
done
