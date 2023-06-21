
50-server.cnf:
  file.managed:
    - name: /etc/mysql/mariadb.conf.d/50-server.cnf
    - source: salt://mariadb/50-server.cnf

50-server.cnf_unique_VPS_id:
  file.line:
    - name: /etc/mysql/mariadb.conf.d/50-server.cnf
    - match: "server_id="
    - mode: replace
    {% if grains["nodename"] == "euw-server-SQL2" %}
    - content: "server_id=2"
    {% elif grains["nodename"] == "euw-server-SQL" %}
    - content: "server_id=1"
    {% endif %}
   
apply_changes_for_redundancy:
  service.running:
    - name: mariadb
    - reload: True
    
