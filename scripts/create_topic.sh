#!/usr/bin/env bash

TOPIC_NAME=$1
PARTITIONS=$2
REPLICATION_FACTOR=$3
MIN_INSYNC_REPLICAS=$4

# Usually, the min_insync_replicas is set to the same value as the replication_factor minus one.
# This ensures that with ack=all, the producer will wait for the data to be written to at least two brokers before acknowledging the write.
# Source: https://www.conduktor.io/kafka/kafka-topic-configuration-min-insync-replicas/

if [ -z "$TOPIC_NAME" ]; then
  echo "Usage: $0 <topic_name> <partitions> <replication_factor> <min_insync_replicas>"
  exit 1
fi

if [ -z "$PARTITIONS" ]; then
  PARTITIONS=1
fi

if [ -z "$REPLICATION_FACTOR" ]; then
  REPLICATION_FACTOR=1
fi

if [ -z "$MIN_INSYNC_REPLICAS" ]; then
  MIN_INSYNC_REPLICAS=1
fi

docker exec -it broker1 sh /usr/bin/kafka-topics --bootstrap-server localhost:9092 --topic "$TOPIC_NAME" --create --if-not-exists --partitions "$PARTITIONS" --replication-factor "$REPLICATION_FACTOR" --config min.insync.replicas="$MIN_INSYNC_REPLICAS"

