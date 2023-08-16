#!/usr/bin/env bash

TOPIC_NAME=$1

docker exec -it broker1 sh /usr/bin/kafka-topics --bootstrap-server localhost:9092 --topic "$TOPIC_NAME" --delete

