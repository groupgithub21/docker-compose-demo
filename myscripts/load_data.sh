#Data Ingestion

curl -X 'POST' \
  'http://localhost:8250/data-sources?dataSource=HR&dataSource=ACRA&withRaw=false' \
  -H 'accept: application/json; charset=UTF-8' \
  -H 'Content-Type: application/json; charset=UTF-8'

curl --location --request POST 'http://localhost:8250/bulk-data/load?dataSource=HR&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/mss/senzing.git/docker-compose-demo/myscripts/HRDataset_v14.json'

curl --location --request POST 'http://localhost:8250/bulk-data/load?dataSource=ACRA&progressPeriod=3000' \
--header 'Content-Type: application/json' \
--data-binary '@/home/mss/senzing.git/docker-compose-demo/myscripts/director_watchlist.json'




