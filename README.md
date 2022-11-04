# Kafka cluster

This project provides you with a Kafka cluster consisting of three brokers. Besides, zookeeper is also run as a 3-node cluster.

Run it with `docker-compose up -d`.

Confirm that kafka & zookeeper work by looking at logs for producer and consumer:
`docker logs -f consumer` and `docker logs -f producer`.

This setup is not meant for production usage, but is very well suited for local integration testing projects and a means of getting to know kafka and zookeeper.

## Acknowledgements

This project is based (or rather copied from) [here](https://github.com/confluentinc/cp-all-in-one/tree/7.2.2-post/cp-all-in-one-kraft). If you think the settings concerning listeners in combination with docker are complex, you are right. [This](https://www.confluent.io/blog/kafka-listeners-explained/) blog post is a nice explanation.
