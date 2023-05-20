#!/bin/bash

# Run apache-bench.sh and spider.sh in parallel
# and wait for both to finish before continuing
./apache-bench.sh PublicDnsName-*.txt > log-ab.txt &
./spider.sh PublicDnsName-*.txt > log-spider &
wait
