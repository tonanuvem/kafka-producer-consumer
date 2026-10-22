echo ""
echo " PRODUCER :"
echo ""

git clone https://github.com/tonanuvem/kafka-producer-microservice.git

cd kafka-producer-microservice

export WEBHOOK_ARG='https://default11dbbfe289b84549be10cec364e595.51.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/09/workflows/e309b78ca50546de973feba14d8bcbb0/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=e_boJ7idLeE-eFZL9TuIzgdRjWzzdPOHmAezp_KYdUs'

echo $WEBHOOK_ARG

docker build -t producer --build-arg WEBHOOK_ARG .

echo ""
echo ""
echo " CONSUMER :"
echo ""

cd .. 

git clone https://github.com/tonanuvem/kafka-consumer-microservice.git && git checkout slack

cd kafka-consumer-microservice

export WEBHOOK_ARG='https://default11dbbfe289b84549be10cec364e595.51.environment.api.powerplatform.com:443/powerautomate/automations/direct/cu/00/workflows/cf9125a0792c445d8df36c853a16a361/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=BwuZwkadQZ0yz8o9emXbujPXorUPmEh8vzNCdH4fyIk'

echo $WEBHOOK_ARG

docker build -t consumer --build-arg WEBHOOK_ARG .

echo ""
echo ""
echo " DOCKER COMPOSE : inserir o arquivo"
echo ""

cd .. && touch docker-compose.yml

echo "kafka:" >>kowl_config.yaml; echo "  brokers:" >>kowl_config.yaml; echo "    - kafka1:19092" >>kowl_config.yaml

cat kowl_config.yaml

echo ""
echo ""
echo " DOCKER COMPOSE : executar"
echo ""
echo ""
echo "docker-compose up -d zoo1 kafka1"
echo ""
echo "docker-compose ps"
echo ""
echo "docker-compose up -d kowl producer"
echo ""
echo "docker-compose up"
