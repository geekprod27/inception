service mysql start
sleep 5
mysql -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS ${SQL_USER} IDENTIFIED BY '${SQL_PASS}';"
mysql -uroot -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}' IDENTIFIED BY '${SQL_PASS}';"
mysql -uroot -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -uroot -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
sleep 5
mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe