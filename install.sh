#!/usr/bin/env bash

# make sure homebrew is up to date
brew update &> /dev/null

# install WP-CLI if you don't got it
if ! hash wp &> /dev/null; then
	brew install wp-cli
fi

# download latest version of Wordpress
wp core download &> /dev/null

# Set up wordpress user/database (password required)
if [ -f wordpress.sql ]; then
	mysql -u root -p < wordpress.sql &> /dev/null
fi

# DB config
wp core config --dbname=wordpress --dbuser=wp_admin --dbpass=wp_admin &> /dev/null
wp core install --url="http://site.com" --title="test site" --admin_user="wp_admin" --admin_password="wp_admin" --admin_email="wp_admin@northpointdigital.com" &> /dev/null
wp rewrite structure '/%postname%/' &> /dev/null

# Wordpress plugins to install (you can do similar for themes)
plugins=(
	https://downloads.wordpress.org/plugin/relative-url.zip
	https://downloads.wordpress.org/plugin/wp-dbmanager.zip
	https://downloads.wordpress.org/plugin/w3-total-cache.zip
	https://downloads.wordpress.org/plugin/google-sitemap-generator.zip
	http://downloads.wordpress.org/plugin/wordpress-seo.latest-stable.zip
	https://downloads.wordpress.org/plugin/co-authors-plus.latest-stable.zip
	https://downloads.wordpress.org/plugin/slideshow-jquery-image-gallery.zip
)
for n in ${plugins[@]}; do
	wp plugin install $n &> /dev/null
done

