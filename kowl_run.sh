rm -rf kowl_config.yaml
echo "kafka:" >>kowl_config.yaml; echo "  brokers:" >>kowl_config.yaml; echo "    - kafka1:19092" >>kowl_config.yaml
mv kowl_docker-compose.yaml docker-compose.yaml

#	Executar o Kafka:
docker-compose up -d zoo1 kafka1

#	Verificar se o Kafka está funcionando:
docker-compose ps
sleep 2

#	Executar diversos serviços através do docker-compose:
docker-compose up -d kowl producer

#	Verificar se o Producer está funcionando:
docker-compose ps
sleep 2

#	Executar consumer através do docker-compose:
docker-compose up
