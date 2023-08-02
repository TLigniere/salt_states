base:
  "SQL-server":
    - mariadb
    - backup_python
    - sending_backups_to_OOS    

  "SQL*":
    - mariadb
    - mariadb-redundancy
#    - slave_user_mariadb 
#    - wordpress_user

  "LAB-server":
    - nfs-server
    - docker_prerequisites

  "MON-server":
    - prometheus
    - alertmanager
    - grafana

  "WP*":
    - wordpress 
    - nfs-client
    - NFS-syncs
    - wordpress_server_several_db

  "HAP-server":
    - haproxy


  "*":
#    - apt_update
    - node_exporter
    - tools
