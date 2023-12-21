zabbix_repository_file:
  file.managed:
    - name: /tmp/zabbix-release.deb
    - source: salt://zabbix/zabbix-release.deb

install_zabbix-release.deb:
  cmd.run:
    - name: "dpkg -i zabbix-release.deb; apt update"

configure_server_of_agent:
  file.blockreplace:
    - marker_start: # Server=
    - marker_end: ### Option: ListenPort
    - content: Server={{ pillar["MON-server"] }}

configure_server_active_of_agent:
  file.blockreplace:
    - marker_start: # ServerActive:
    - marker_end: ### Option: Hostname
    - content: ServerActive={{ pillar["MON-server"] }}

agent_service:
  service.running:
    - name: zabbix-agent
    - enable: True
    - reload: True
