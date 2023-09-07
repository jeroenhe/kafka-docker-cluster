# Kafka cluster

This project provides you with a Kafka cluster consisting of three brokers. It no longer depends on Zookeeper because it uses [Kraft](https://developer.confluent.io/learn/kraft/) which is available and started from the kafka container.

## Scripts

The scripts are bash and work on linux and mac, but they are essentially just docker-compose commands. So you can also run them on windows.

`./up.sh` starts the cluster and tails the log in the background (can be safely cancelled via crtl-c without stopping the containers).
`./down.sh` stops (and removes).
Use `./clean.sh` to remove related volumes containing kafka cluster data.
`./restart.sh` will run docker-compose restart on all containers.

## Configuration

Topic creation is disabled, but can be enabled for the cluster via the `KAFKA_AUTO_CREATE_TOPICS_ENABLE: 'true'` setting.
To update the (confluent) kafka version and others, edit the `.env` file.
Remember to comment the `PLATFORM` env in case you are not running on an arm64 platform.

## Testing

To manage the cluster, visit `http://localhost:8405` to see the [akhq](https://akhq.io/) website.

Also, the `producer` container produces messages on the `test` topic and the `consumer` container consumes them. You can see the output in the logs of the `consumer` container (`docker-compose logs -f consumer`).

## Disclaimer

This setup is not meant for production usage, but is very well suited for local integration testing projects and a means of getting to know kafka and zookeeper.

## Acknowledgements

This project is based (or rather copied from) [here](https://github.com/confluentinc/cp-all-in-one/tree/7.2.2-post/cp-all-in-one-kraft). If you think the settings concerning listeners in combination with docker are complex, you are right. [This](https://www.confluent.io/blog/kafka-listeners-explained/) blog post is a nice explanation.
