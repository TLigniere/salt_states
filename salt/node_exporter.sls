exporter:
  user.present:
    - fullname: exporter
    - shell: /bin/false
    - home: /home/exporter
    - groups:
      - exporter

exporter-g:
  group.present:
    - name: exporter
    - system: True
    - addusers:
      - exporter 

/usr/local/bin/node_exporter:
  file.managed:
    - source: salt://exporter/node_exporter-1.6.0.linux-amd64/node_exporter
    - keep_source: False
    - user: exporter
    - group: exporter
    - mode: 744

/lib/systemd/system/node_exporter.service:
  file.managed:
    - source: salt://exporter/node_exporter-1.6.0.linux-amd64/node_exporter.service
    - keep_source: False

exporter-s:
  service.running:
    - name: node_exporter
    - enable: True
    - reload: True
