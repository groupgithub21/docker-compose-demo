export GIT_ACCOUNT=senzing
export GIT_REPOSITORY=docker-compose-demo
export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"

export SENZING_VOLUME=/opt/senzing

export SENZING_DATA_DIR=${SENZING_VOLUME}/data
export SENZING_DATA_VERSION_DIR=${SENZING_DATA_DIR}/2.0.0
export SENZING_ETC_DIR=${SENZING_VOLUME}/etc
export SENZING_G2_DIR=${SENZING_VOLUME}/g2
export SENZING_VAR_DIR=${SENZING_VOLUME}/var

export POSTGRES_DIR=${SENZING_VAR_DIR}/postgres
export RABBITMQ_DIR=${SENZING_VAR_DIR}/rabbitmq

export SENZING_ACCEPT_EULA="I_ACCEPT_THE_SENZING_EULA"

cd ${GIT_REPOSITORY_DIR}
sudo docker-compose --file resources/senzing/docker-compose-senzing-installation.yaml down
sudo docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql.yaml down
sudo docker-compose --file resources/postgresql/docker-compose-rabbitmq-postgresql-again.yaml down

sudo rm -rf ${SENZING_VAR_DIR}

