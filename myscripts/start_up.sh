sudo echo "Starting Senzing"
sudo mkdir -p ${RABBITMQ_DIR}
sudo chmod 770 ${RABBITMQ_DIR}

cd ${GIT_REPOSITORY_DIR}

# sudo \
#   --preserve-env \
#   docker-compose --file resources/senzing/docker-compose-senzing-installation.yaml pull

# sudo \
#   --preserve-env \
#   docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql.yaml pull

cd ${GIT_REPOSITORY_DIR}
sudo \
  --preserve-env \
  docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql.yaml up


