
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

web server with the haproxy:
  file.append:
    - name: /etc/haproxy/haproxy.cfg
    - text: |
       "#Managed by salt"
       backend rgw
               balance roundrobin
               mode http
       {% for machines in salt['pillar.get']('WebMachineIP') %}
               server rgw{{ machines["id"] }} {{ machines["IP"] }}:80 check
       {% endfor %}


haproxy-s:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
