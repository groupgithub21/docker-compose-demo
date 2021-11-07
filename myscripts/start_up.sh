# Important, Do this first. https://senzing.zendesk.com/hc/en-us/articles/115002408867-Quickstart-Guide
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

sudo mkdir -p ${RABBITMQ_DIR}
sudo chmod 770 ${RABBITMQ_DIR}

export SENZING_ACCEPT_EULA="I_ACCEPT_THE_SENZING_EULA"

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

#Data Ingestion

curl -X 'POST' \
  'http://192.168.180.237:8250/data-sources?dataSource=CIVIL&dataSource=WATCHLIST&withRaw=false' \
  -H 'accept: application/json; charset=UTF-8' \
  -H 'Content-Type: application/json; charset=UTF-8'

curl --location --request POST 'http://192.168.180.237:8250/bulk-data/load?dataSource=CIVIL&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/hanifa/senzing/mydata_1/cpib_demo/civil_servant.json'

curl --location --request POST 'http://192.168.180.237:8250/bulk-data/load?dataSource=WATCHLIST&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/hanifa/senzing/mydata_1/cpib_demo/director_watchlist.json'





