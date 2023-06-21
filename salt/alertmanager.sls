alertmanager:
  user.present:
    - fullname: alertmanager
    - shell: /bin/false
    - home: /home/alertmanager

alertmanager-g:
  group.present:
    - name: alertmanager
    - system: True
    - addusers:
      - alertmanager

/usr/local/bin/alertmanager:
  file.managed:
    - source: salt://prometheus/alertmanager-0.25.0.linux-amd64/alertmanager
    - keep_source: False
    - user: alertmanager
    - group: alertmanager
    - mode: 744

/usr/local/bin/alertmanager.yml:
  file.managed:
    - source: salt://prometheus/alertmanager-0.25.0.linux-amd64/alertmanager.yml
    - keep_source: False

/lib/systemd/system/alertmanager.service:
  file.managed:
    - source: salt://prometheus/alertmanager-0.25.0.linux-amd64/alertmanager.service
    - keep_source: False

/data/alertmanager:
  file.directory:
    - name: /data/alertmanager
    - user: alertmanager
    - group: alertmanager
    - mode: 744
 
alertmanager-s:
  service.running:
    - name: alertmanager
    - enable: True
