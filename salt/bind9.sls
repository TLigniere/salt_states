bind-package:
  pkg.installed:
    - name: bind9

delete_content_named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - contents: ""

add_zones_to_named.conf.local_using_pillar_as_ref:
  file.append:
    - name: /etc/bind/named.conf.local
    - text: |
       "#Managed by SALT, every modification will be deleted at the next state.apply of salt"
       {% for zones in salt["pillar.get"]("bind") %}
         zone "{{ zones["name"] }}" {
           type master;
           file "/etc/bind/db.{{ zones["name"] }};
         };

       {% endfor %}

import_db.zones_files_declared_in_pillar:
  file.managed:
  - name:
       {% for zones in salt["pillar.get"]("bind") %}
         /etc/bind/db.{{ zones["name"] }}
       {% endfor %}


  - source:
       {% for zones in salt["pillar.get"]("bind") %}
         salt://bind/db.{{ zones["name"] }}
       {% endfor %}

bind9_service_reload:
  service.running:
    - name: bind9
    - enable: True
    - reload: True
