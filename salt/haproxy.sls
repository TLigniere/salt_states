
haproxy-pkg:
  pkg.installed:
    - name: haproxy

haproxy-config-backup:
  file.copy:
    - source: /etc/haproxy/haproxy.cfg 
    - name: /etc/haproxy/haproxy.cfg.bak

haproxy-config:
  file.managed:
    - source: salt://haproxy/haproxy.cfg
    - name: /etc/haproxy/haproxy.cfg

haproxy-s:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
