build:
	docker-compose build --parallel

start:
	docker-compose stop
	docker-compose up -d
	docker-compose ps

down:
	docker-compose down

rebuild:
	$(MAKE) down build start

list-brokers:
	kafkacat -b 0.0.0.0:9092 -L

produce-to-topic:
	kafkacat -P -b 0.0.0.0:9092 -t $(name)

consume-from-topic:
	kafkacat -C -b 0.0.0.0:9092 -t $(name)

logs:
	docker-compose logs -f

logs4:
	docker-compose logs -f | grep '$(container)'

schemas-list:
	curl --silent -X GET http://0.0.0.0:8081/subjects/ | jq .

schemas-get:
	curl --silent -X GET http://localhost:8081/schemas/ids/1 | jq .

schemas-add:
	curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" -d @./avro/basicavro.avsc http://0.0.0.0:8081/subjects/basicavro/versions