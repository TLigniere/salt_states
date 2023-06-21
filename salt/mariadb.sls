mariadb:
  user.present:
    - name: mariadb
    - shell: /bin/false
    - home: /home/mariadb

mariadb-g:
  group.present:
    - name: mariadb
    - system: True
    - addusers:
      - mariadb

debconf-utils:
  pkg.installed:
    - pkgs:
      - debconf-utils
      - python3
      - python3-pip
mariadb-server:
  pkg:
    - installed  
    - reload_modules: True

mariadb-config:
  pkg.installed:
    - name: libmariadb-dev

mariadb-service:
  service.running:
    - name: mariadb
    - enable: True
    - reload: True
mysql-py:
  cmd.run:
    - name: pip install  mysql PyMySQL mysqlclient

conf for mysql:
  file.managed:
    - source: salt://mysql_conf
    - name: /etc/salt/minion.d/mysql_conf
    - keep_source: False



