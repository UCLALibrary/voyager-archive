#!/bin/bash

# Run this in the local environment, after docker-compose up,
# from the root of the project - the same directory as docker-compose.yml
# If any problems, shut down and restart the docker-compose system.

# Create database objects
docker-compose exec -T db psql -U voyager_archive < sql_support/create_psql_tables.sql
docker-compose exec -T db psql -U voyager_archive < sql_support/create_psql_functions.sql
docker-compose exec -T db psql -U voyager_archive < sql_support/create_psql_views.sql

# Load sample data
docker-compose exec -T db psql -U voyager_archive < sql_support/sample_data.sql
