# README #

Ever needed to quickly spin up a WordPress install for someone?


```
bash install.sh
```

Requirements:

* OSX Command Line Tools
* Homebrew

If you have MySQL installed with root access (not required), it will create the WordPress DB, and you'll also have the ability to install themes and plugins; e.g.:

```
	# Wordpress plugins to install
	plugins=(
		https://downloads.wordpress.org/plugin/relative-url.zip
		https://downloads.wordpress.org/plugin/wp-dbmanager.zip
		https://downloads.wordpress.org/plugin/w3-total-cache.zip
		https://downloads.wordpress.org/plugin/google-sitemap-generator.zip
		http://downloads.wordpress.org/plugin/wordpress-seo.latest-stable.zip
		https://downloads.wordpress.org/plugin/co-authors-plus.latest-stable.zip
		https://downloads.wordpress.org/plugin/slideshow-jquery-image-gallery.zip
	)
```

If you're importing an existing DB, add your `CREATE` statements to wordpress.sql, or just run `wp db import file.sql`