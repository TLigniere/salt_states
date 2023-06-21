
wordpress_user:
  mysql_user.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - name: wordpress
    - host: {{ pillar["WP-server"] }}
    - allow_passwordless: True

wordpress_2_user:
  mysql_user.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - name: wordpress
    - host: {{ pillar["WP2-server"] }}
    - allow_passwordless: True




wordpress_DB:
  mysql_database.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - name: wordpress

wordpress_privileges:
  mysql_grants.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - grant: SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
    - database: wordpress.*
    - user: wordpress
    - host: {{ pillar["WP-server"] }}

wordpress_2_privileges:
  mysql_grants.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - grant: SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
    - database: wordpress.*
    - user: wordpress
    - host: {{ pillar["WP2-server"] }}





