#!/bin/bash


docker run --name mysql-container \
  -v $(pwd)/databases:/usr/databases \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=my_database \
  -d -p 3306:3306 mysql

# mysql -uroot -prootpassword

# source /usr/databases/sakila-db/sakila-schema.sql

# source /usr/databases/sakila-db/sakila-data.sql