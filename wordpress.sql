CREATE DATABASE IF NOT EXISTS `wordpress`;
GRANT ALL PRIVILEGES ON `wordpress`.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'wp_admin';
FLUSH PRIVILEGES;

# If you're importing an existing DB, add your CREATE statements here