setup:
	@echo "===========Start installing Airflow and create DB==========="
	@echo "AIRFLOW_UID=$$(id -u)\nAIRFLOW_GID=0" > .env
	docker-compose down
	docker-compose up airflow-init && docker-compose up -d
	@echo "===========Waiting for Airflow ready==========="
	sleep 30s
	@echo "===========Environment Ready. Access Airflow at localhost:8080"
cleanup:
	docker-compose down