setup:
	@echo "===========Start installing Airflow and create DB==========="
	@echo "AIRFLOW_UID=$$(id -u)\nAIRFLOW_GID=0" > .env
	docker-compose down
	docker-compose up airflow-init && docker-compose up -d
	@echo "===========Waiting for Airflow ready==========="
	sleep 45s
	@echo "===========Adding DB connections to Airflow==========="
	docker-compose run airflow-worker airflow connections add 'db_source' --conn-uri 'psql://admin:admin@dbsource:5432/dbsource' && docker-compose run airflow-worker airflow connections add 'db_target' --conn-uri 'psql://admin:admin@dbtarget:5432/dbtarget'
	@echo "===========Environment Ready. Access Airflow at localhost:8080"
cleanup:
	docker-compose down
	docker-compose down --volumes --remove-orphans
	docker-compose down --volumes --rmi all