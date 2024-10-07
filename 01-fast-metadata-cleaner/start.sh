#!/usr/bin/env bash
airflow db reset
airflow db migrate
airflow users create --username "wfc" --role "Admin" --password "wfc" --email "empty" --firstname "admin" --lastname "admin"
export AIRFLOW__CORE__DAGS_FOLDER=./dags
export AIRFLOW__CORE__PLUGINS_FOLDER=./plugins
export AIRFLOW__CORE__LOAD_EXAMPLES=false
export AIRFLOW__WEBSERVER__WORKERS=2
airflow connections delete docker_postgresql
airflow connections add --conn-host localhost --conn-type postgres --conn-login wfc_test --conn-password wfc_test --conn-port 5432 docker_postgresql
airflow connections delete docker_postgresql_uri
airflow connections add --conn-uri postgresql://wfc_test:wfc_test@localhost:5432/wfc docker_postgresql_uri
airflow webserver & airflow scheduler
