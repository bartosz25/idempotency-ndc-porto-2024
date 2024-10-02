CREATE KEYSPACE ndc_porto WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor':1 };

USE ndc_porto;

CREATE TABLE sessions (
session_id BIGINT,
user_id BIGINT,
pages LIST<TEXT>,
ingestion_time TIMESTAMP,
PRIMARY KEY(session_id, user_id));