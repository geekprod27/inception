service mysql start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER} IDENTIFIED BY '${SQL_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}' IDENTIFIED BY '${SQL_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
service mysql stop
exec mysqld_safe