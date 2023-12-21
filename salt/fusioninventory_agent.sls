fusioninventory-agent_installation:
  pkg.installed:
    - name: fusioninventory-agent

link_to_glpi_server:
  file.blockreplace:
    - marker_start: # send tasks results to a FusionInventory for GLPI server
    - marker_end: # write tasks results in a directory
    - content: server = http://{{ pillar["GLP_server"] }}/glpi/plugins/fusioninventory/

fusioninventory-agent_service:
  service.running:
    - name: fusioninventory-agent
    - enable: True
    - reload: True
