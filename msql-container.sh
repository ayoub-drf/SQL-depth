docker run --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -e MYSQL_DATABASE=my_database \
  -d -p 3306:3306 mysql:latest
  