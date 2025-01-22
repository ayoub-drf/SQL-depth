#!/bin/bash

docker run -d \
  --name my_postgres_container \
  -e POSTGRES_PASSWORD=mypassword \
  -p 5432:5432 \
  postgres
