#!/bin/bash

mysqldump -uwp_admin -p --add-locks --skip-extended-insert --skip-quick --databases wordpress | cat > wp-$(date +%Y-%m-%d-%H.%M.%S).sql;

gzip -c *.php wp-* license.txt *.html > wp_site.tar.gz

#scp wp_site.gz user@host.com:/path/to/wordpress