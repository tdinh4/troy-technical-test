Data Engineer Task : The setup for the data pipeline of a basic data warehouse using Docker and Apache Airflow. 
---
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

- Clone this repo
- Install the prerequisites
- Run the service
- Check http://localhost:8080
- Trigger DAG for transferring the content of Source Database X to Target Database Y
- Inspect Database 
- Done! :tada:

### Prerequisites

- Install [Docker](https://www.docker.com/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)

### Ussage

Run the web service airflow and setup postgred DB with docker

```
git clone https://github.com/tdinh4/troy-technical-test.git
cd troy-technical-test/
make setup
```

Check http://localhost:5884/

### Tigger DAG

- Trigger DAG manually via Airflow webserver at localhost:5884 
- DAG name `postgres_migration`

### Inpsect database

For inspect source postgres database, use the following command

1. Go inside source postgres database container
```
docker exec -it $(docker ps -aqf "name=troy-technical-test_dbsource_1") bash
```

2. Connect to source postgres database
- Host : dbsource
- Schema : dbsource
- Login : admin
- Password : admin
```
psql -d dbsource -U admin -W
root@90609c2929e9:/# psql -d dbsource -U admin -W
Password:
dbsource=# select * from db_source;
```

For inspect target postgres database, use the following command

1. Go inside target postgres database container
```
docker exec -it $(docker ps -aqf "name=troy-technical-test_dbtarget_1") bash
```

2. Connect to target postgres database
- Host : dbtarget
- Schema : dbtarget
- Login : admin
- Password : admin
```
psql -d dbtarget -U admin -W
root@90609c2929e9:/# psql -d dbtarget -U admin -W
Password:
dbsource=# select * from db_target;
```

Inspect target postgres database before & after trigger DAG to see changes in table after transfering data from source DB to target DB.

### Cleaning Up

To stop and delete containers, delete volumes with database data and download images, run:

```
make cleanup
```

## Credits

- [Apache Airflow Docker](https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html)