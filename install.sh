#!/usr/bin/env bash

# make sure homebrew is up to date
echo -e "Updating Homebrew"
brew update &> /dev/null

# install WP-CLI if you don't got it
if ! hash wp &> /dev/null; then
	echo -e "Installing WP-CLI"
	brew install wp-cli
fi

# download latest version of Wordpress
echo -e "Downloading WordPress"
wp core download &> /dev/null

# Set up wordpress user/database (password required)
if [ -f wordpress.sql ]; then
	echo -e "Setting up MySQL (password required)"
	mysql -u root -p < wordpress.sql &> /dev/null
fi

# DB config
echo -e "Configuring WordPress"
wp core config --dbname=wordpress --dbuser=wp_admin --dbpass=wp_admin &> /dev/null
wp core install --url="http://site.com" --title="test site" --admin_user="wp_admin" --admin_password="wp_admin" --admin_email="wp_admin@northpointdigital.com" &> /dev/null
wp rewrite structure '/%postname%/' &> /dev/null

# Wordpress plugins to install (you can do similar for themes)
plugins=(
	http://downloads.wordpress.org/plugin/relative-url.zip
	http://downloads.wordpress.org/plugin/wp-dbmanager.zip
	http://downloads.wordpress.org/plugin/w3-total-cache.zip
	http://downloads.wordpress.org/plugin/google-sitemap-generator.zip
	http://downloads.wordpress.org/plugin/wordpress-seo.latest-stable.zip
	http://downloads.wordpress.org/plugin/co-authors-plus.latest-stable.zip
	http://downloads.wordpress.org/plugin/slideshow-jquery-image-gallery.zip
)
echo -e "Installing Plugins"
for n in ${plugins[@]}; do
	wp plugin install $n &> /dev/null
done

