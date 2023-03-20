

if [ ! -f /var/www/wordpress/wp-config.php ]; then
wp config create --allow-root \
--dbname=$SQL_DATABASE \
--dbuser=$SQL_USER \
--dbpass=$SQL_PASS \
--dbhost=mariadb:3306 --path='/var/www/wordpress' --url="nfelsemb.42.fr"

wp core install --allow-root \
--title=$wp_title \
--admin_user=$wp_admin \
--admin_password=$wp_pass \
--admin_email=$wp_email --path='/var/www/wordpress' --url="nfelsemb.42.fr" --skip-email

wp user create --allow-root "$WP_USER" "$WP_USER_MAIL" --user_pass="$WP_USER_PASS" --path='/var/www/wordpress'
fi

# chown -R root:root /var/www/
# chmod -R 755 /var/www/

exec php-fpm7.3 -F