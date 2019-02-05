Docker compose 

Utiliza os seguintes serviços:

  Kafka:
    - spotify/kafka (opção leve: kafka + zookeper)
    - landoop/fast-data-dev (opção completa:  Kafka, Registry, Connect, Landoop, Stream-Reactor, KCQL )

  Producer:
    - tonanuvem/64aoj_producer_kafka:latest (python api)

  Consumer:
    - tonanuvem/64aoj_consumer_kafka:latest (node js consumer que publica as mensagens no Slack AOJ)
