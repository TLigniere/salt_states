
python-pkg:
  pkg.installed:
    - name: python3

python-mysql-connector:
  pip.installed:
    - pkgs: 
      - mysql-connector
      - boto3
      - boto


python-f:
  file.directory:
    - name: /opt/python
    - mode: 755

backup_sql-d:
  file.directory:
    - name: /usr/local/bin/backup_sql

backup_database.py:
  file.managed:
    - source: salt://backup_python/backup_database.py
    - name: /opt/python/backup_database.py

backup_database2.py:
  file.managed:
    - source: salt://backup_python/backup_database2.py
    - name: /opt/python/backup_database2.py

Daily backup:
  cron.present:
    - name: python3 /opt/python/backup_database2.py
    - user: root
    - minute: 0
    - hour: 18

Delete the oldest backup every day:
  cron.present:
    - name: rm /usr/local/bin/backup_sql "$(ls -t | tail -1)"
    - user: root
    - minute: 0
    - hour: 20
