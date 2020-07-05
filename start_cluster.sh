start_zookeper_kafka() {
  docker-compose up -d
}

check_control_center_up() {
  FOUND=$(docker-compose logs kafka | grep "started (kafka.server.KafkaServer)")
  if [ -z "$FOUND" ]; then
    return 1
  fi
  return 0
}
