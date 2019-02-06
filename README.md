<li> Docker 

> docker run --name Kafka -p 2181:2181 -p 9092:9092 --net=host --env ADVERTISED_HOST=IP --env ADVERTISED_PORT=9092 -d spotify/kafka

> docker run --name produtor_Kafka -p 5001:5001 --rm --net=host --env TOPICO=meu-topico --env HOST=IP --env PORTA=9092 -d tonanuvem/64aoj_producer_kafka:latest

> docker run --name consumidor_Kafka --rm --net=host --env TOPICO=meu-topico --env HOST=IP --env PORTA=9092 tonanuvem/64aoj_consumer_kafka:latest

<li> Docker-compose utiliza os seguintes serviços:

>  Kafka:
    - spotify/kafka (opção leve: kafka + zookeper)
    - landoop/fast-data-dev (opção completa:  Kafka, Registry, Connect, Landoop, Stream-Reactor, KCQL )

>  Producer:
    - tonanuvem/64aoj_producer_kafka:latest (python api)

>  Consumer:
    - tonanuvem/64aoj_consumer_kafka:latest (node js consumer que publica as mensagens no Slack AOJ)
