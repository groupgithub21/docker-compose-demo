sudo echo "Stop Senzing"

cd ${GIT_REPOSITORY_DIR}
sudo docker-compose --file resources/senzing/docker-compose-senzing-installation.yaml down
sudo docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql.yaml down
sudo docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql-again.yaml down

sudo rm -rf ${SENZING_VAR_DIR}

