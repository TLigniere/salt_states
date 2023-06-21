
boto_config:
  file.managed:
    - name: /opt/python/boto_config.py
    - source: salt://backup_python/boto_config.py

boto_backup:
  file.managed:
    - name: /opt/python/boto_backup.py
    - source: salt://backup_python/boto_cmd.py   

Daily Backup in bucket :
  cron.present:
    - name: python3 /opt/python/boto_config.py
    - user: root
    - minute: 0
    - hour: 19

