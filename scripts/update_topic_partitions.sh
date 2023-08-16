#!/usr/bin/env bash

TOPIC_NAME=$1
PARTITIONS=$2

if [ -z "$TOPIC_NAME" ]; then
  echo "Usage: $0 <topic_name> <partitions>"
  exit 1
fi

if [ -z "$PARTITIONS" ]; then
  PARTITIONS=1
fi

docker exec -it broker1 sh /usr/bin/kafka-topics --alter --bootstrap-server localhost:9092 --topic "$TOPIC_NAME" --partitions "$PARTITIONS" --config min.insync.replicas="$MIN_INSYNC_REPLICAS"
