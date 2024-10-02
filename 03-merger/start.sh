#!/usr/bin/env bash
airflow db reset
airflow db migrate
airflow users create --username "admin" --role "Admin" --password "admin" --email "empty" --firstname "admin" --lastname "admin"
export AIRFLOW__CORE__DAGS_FOLDER=./dags
export AIRFLOW__CORE__LOAD_EXAMPLES=false
export AIRFLOW__WEBSERVER__WORKERS=2
airflow webserver & airflow scheduler