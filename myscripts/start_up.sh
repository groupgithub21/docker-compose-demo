<<<<<<< HEAD
sudo echo "Starting Senzing"
sudo mkdir -p ${RABBITMQ_DIR}
sudo chmod 770 ${RABBITMQ_DIR}

=======
# Important, Do this first. https://senzing.zendesk.com/hc/en-us/articles/115002408867-Quickstart-Guide
sudo mkdir -p ${RABBITMQ_DIR}
sudo chmod 770 ${RABBITMQ_DIR}


>>>>>>> 4a507d0ec1db1a0ac3535b9c76495f780afd4cb2
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

<<<<<<< HEAD
=======
#Data Ingestion

curl -X 'POST' \
  'http://192.168.180.237:8250/data-sources?dataSource=HR&dataSource=ACRA&withRaw=false' \
  -H 'accept: application/json; charset=UTF-8' \
  -H 'Content-Type: application/json; charset=UTF-8'

curl --location --request POST 'http://192.168.180.237:8250/bulk-data/load?dataSource=HR&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/senzing-hanifa/senzing.git/docker-compose-demo/myscripts/data/HRDataset_v14.json'

curl --location --request POST 'http://192.168.180.237:8250/bulk-data/load?dataSource=ACRA&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/senzing-hanifa/senzing.git/docker-compose-demo/myscripts/data/director_watchlist.json'




>>>>>>> 4a507d0ec1db1a0ac3535b9c76495f780afd4cb2

