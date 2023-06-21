xprometheus-g:
  group.present:
    - name: prometheus
    - system: True

prometheus-u:
  user.present:
    - fullname: prometheus
    - shell: /bin/false
    - home: /home/prometheus
    - groups:
      - prometheus

/data:
  file.directory:
    - name: /data
    - mode: 755 
  cmd.run:
    - name: echo "Directory exists"

/data/prometheus:
  file.directory:
    - name: /data/prometheus
    - user: prometheus
    - group: prometheus
    - mode: 744
  cmd.run:
    - name: echo "Directory exists"      
        
/usr/local/bin/prometheus:
  file.managed:
    - source: salt://prometheus/prometheus-2.44.0.linux-amd64/prometheus
    - keep_source: False
    - user: prometheus
    - group: prometheus
    - mode: 744
    
/usr/local/bin/promtool:
  file.managed:
    - source: salt://prometheus/prometheus-2.44.0.linux-amd64/promtool
    - keep_source: False
    - mode: 744

/usr/local/bin/prometheus.yml:
  file.managed:
    - source: salt://prometheus/prometheus-2.44.0.linux-amd64/prometheus.yml 
    - keep_source: False
    - mode: 744

/usr/local/bin/rules_prometheus.yml:
  file.managed:
    - source: salt://prometheus/prometheus-2.44.0.linux-amd64/rules_prometheus.yml
    - keep_source: False
    - mode: 744

/lib/systemd/system/prometheus.service:
  file.managed:
    - source: salt://prometheus/prometheus-2.44.0.linux-amd64/prometheus.service
    - keep_source: False


prometheus-s:
  service.running:
    - name: prometheus
    - enable: True
    - reload: True
    

