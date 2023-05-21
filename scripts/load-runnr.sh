#!/bin/bash

TAG=$(date +%F-%H-%M-%S)

# Run apache-bench.sh and spider.sh in parallel
# and wait for both to finish before continuing
for i in {1..10}; do
  ./apache-bench.sh PublicDnsName-*.txt > ab${i}-${TAG}.txt &
  ./spider.sh PublicDnsName-*.txt > spider${i}-${TAG}.txt &
done
