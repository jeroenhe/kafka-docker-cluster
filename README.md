# Kafka cluster

This project provides you with a Kafka cluster consisting of three brokers. Besides, zookeeper is also run as a 3-node cluster.

Run it with `docker-compose up -d`.

Confirm that kafka & zookeeper work by looking at logs for producer and consumer:
`docker logs -f consumer` and `docker logs -f producer`.

This setup is not meant for production usage, but is very well suited for local integration testing projects and a means of getting to know kafka and zookeeper.
