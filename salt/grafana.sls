grafana-g:
  group.present:
    - name: grafana
    - system: True

grafana-u:
  user.present:
    - name: grafana
    - fullname: grafana
    - shell: /bin/false
    - home: /home/grafana
    - groups: 
      - grafana

grafana-key:
  file.exists:
    - name: /usr/share/keyrings/grafana.key
  cmd.run:
    - name: "wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key "

/etc/apt/sources.list.d/grafana.list:
  file.append:
    - name: /etc/apt/sources.list.d/grafana.list
    - text: "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main"


grafana-enterprise:
  pkg.installed:  
    - name: grafana-enterprise

grafana-s:
  service.running:
    - name: grafana-server
    - enable: True
    - reload: True
    - require:
      - pkg: grafana-enterprise
