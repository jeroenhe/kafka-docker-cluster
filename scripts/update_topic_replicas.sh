#!/usr/bin/env bash

TOPIC_NAME=$1
REPLICATION_FACTOR=$2

if [ -z "$TOPIC_NAME" ]; then
  echo "Usage: $0 <topic_name> <replication_factor>"
  exit 1
fi

if [ -z "$REPLICATION_FACTOR" ]; then
  REPLICATION_FACTOR=1
fi

docker exec -it broker1 sh /usr/bin/kafka-topics --alter --bootstrap-server localhost:9092 --topic "$TOPIC_NAME" --replication-factor "$REPLICATION_FACTOR"
