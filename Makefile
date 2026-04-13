start-project:
	docker compose -p mlops up -d --build

stop-project:
	docker compose -p mlops down

test:
	bash ./tests/run_tests.sh

build-api:
	docker build -t api_v1 -f ./src/api/v1/Dockerfile .
	docker build -t api_v2 -f ./src/api/v2/Dockerfile .

run-api:
	docker run --rm -d --name api_v1_c -p 8000:8000 api_v1
	docker run --rm -d --name api_v2_c -p 8001:8000 api_v2

stop-api:
	docker stop api_v1_c
	docker stop api_v2_c

run-project:
	# run project
	@echo "Grafana UI: http://localhost:3000"

test-api:
	curl -X POST "https://localhost/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	 --user admin:admin \
     --cacert ./deployments/nginx/certs/nginx.crt;
