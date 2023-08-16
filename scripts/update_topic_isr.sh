#!/usr/bin/env bash

TOPIC_NAME=$1
MIN_INSYNC_REPLICAS=$2

if [ -z "$TOPIC_NAME" ]; then
  echo "Usage: $0 <topic_name> <partitions> <min_insync_replicas>"
  exit 1
fi

if [ -z "$MIN_INSYNC_REPLICAS" ]; then
  MIN_INSYNC_REPLICAS=1
fi

docker exec -it broker1 sh /usr/bin/kafka-topics --bootstrap-server localhost:9092 --topic "$TOPIC_NAME" --alter --config "min.insync.replicas=$MIN_INSYNC_REPLICAS"
