prerequisites for wordpress:
  pkg.installed:
    - pkgs:
      - apache2
      - ghostscript
      - libapache2-mod-php
      - php
      - php-bcmath
      - php-curl
      - php-imagick
      - php-intl
      - php-json
      - php-mbstring
      - php-mysql
      - php-xml
      - php-zip


wordpress-g:
  group.present:
    - name: wordpress
    - system: True

wordpress-u:
  user.present:
    - name: wordpress
    - shell: /bin/false
    - home: /home/wordpress
    - groups:
      - wordpress

/srv/www:
  file.directory:
    - name: /srv/www
    - mode: 755
    - user: www-data
    - group: www-data
  cmd.run:
    - creates:
      - /srv/www

/srv/www/wordpress:
  file.recurse:
    - name: /srv/www/wordpress
    - source: salt://wordpress/wordpress
    - file_mode: 644
    - dir_mode: 755
    - user: www-data
    - group: www-data
    - keep_source: True

/etc/apache2/sites-available/wordpress.conf:
  file.managed:
    - name: /etc/apache2/sites-available/wordpress.conf
    - source: salt://wordpress/wordpress.conf 
    - keep_source: False

#/etc/apache2/apache.conf:
 # file.append:
  #  - name: /etc/apache2/apache.conf
   # - text: "SetHandler application/x-httpd-php"
    
Start Wordpress:
  cmd.run:
    - name: " a2enmod php8.1; a2ensite wordpress; a2enmod rewrite; a2dissite 000-default; systemctl reload apache2"


apache2:
  service.running:
    - enable: True
    - reload: True

