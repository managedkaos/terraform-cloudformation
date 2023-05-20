#!/bin/bash

TAG=$(date +%F-%H-%M-%S)

# Run apache-bench.sh and spider.sh in parallel
# and wait for both to finish before continuing
./apache-bench.sh PublicDnsName-*.txt > ab-${TAG}.txt &
./spider.sh PublicDnsName-*.txt > spider-${TAG} &
wait
