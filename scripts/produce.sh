#!/usr/bin/env bash

KAFKACAT_CONFLUENT_VERSION=7.1.8

TOPIC_NAME=$1
KEY=$2
VALUE=$3

if [ -z "$TOPIC_NAME" ]; then
  echo "Usage: $0 <topic_name> <key> <value>"
  exit 1
fi

docker run --rm --interactive --network kafka_default confluentinc/cp-kafkacat:$KAFKACAT_CONFLUENT_VERSION \
           kafkacat -b broker1:9092 \
                    -t "${TOPIC_NAME}" \
                    -K: \
                    -P <<EOF
$KEY:$VALUE
EOF
