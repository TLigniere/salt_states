slave_user:
  mysql_user.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - name: slave    
    - host: {{ pillar["SQL2-server"] }}
    - password: {{ pillar["password_slave"] }}

slave_privileges:
  mysql_grants.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - grant: SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,REPLICATION SLAVE 
    - database: "*.*"
    - user: slave
    - password: {{ pillar["password_slave"] }}
    - host: {{ pillar["SQL2-server"] }}

slave_local_user:
  mysql_user.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - name: slave
    - host: {{ pillar["SQL-server"] }}
    - password: {{ pillar["password_slave"] }}

slave_local_privileges:
  mysql_grants.present:
    - connection_pass: {{ pillar["password_sql"] }}
    - grant: SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,REPLICATION SLAVE
    - database: "*.*"
    - user: slave
    - host: {{ pillar["SQL-server"] }}



