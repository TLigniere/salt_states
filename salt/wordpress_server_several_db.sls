
/srv/www/wordpress/db-config.php:
  file.managed:
    - source: salt://wordpress/hyperdb/db-config.php
    - name: /srv/www/wordpress/db-config.php
    - user: wordpress
    - group: wordpress
    - keep_source: False

/srv/www/wordpress/wp-content/db.php:
  file.managed:
    - source: salt://wordpress/hyperdb/db.php
    - name: /srv/www/wordpress/wp-content/db.php
    - user: wordpress
    - group: wordpress
    - keep_source: False

